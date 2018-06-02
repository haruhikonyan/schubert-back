class Api::TeamsController < ApplicationController

  before_action :authenticate!, only: [:update, :destroy]
  before_action :set_team, only: [:show, :login]

  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.order(updated_at: :desc)
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(team_savable_params)

    if @team.save
      render :show, status: :created
    else
      render json: @team.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    # TODO エラーハンドリングを共通化する
    if !@current_team
      render json: false, status: :unauthorized
    elsif @current_team.update(team_savable_params)
      # TODO わざわざ入れ替えるのすこぶる微妙なのでどうにかする
      @team = @current_team
      render :show, status: :ok
    else
      render json: @current_team.errors, status: :unprocessable_entity
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @current_team.destroy
  end

  def login
    if @team.authenticate(params[:password])
      @token = Jwt::TokenProvider.refresh_token @team
      render :login, status: :ok
    else
      render json: false, status: :unauthorized
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # 破壊的なのでデバッグ時注意    
    def team_savable_params
      team_params = params[:team].try!(:permit!)
      team_params[:type_ids] = team_params[:types].pluck(:id)
      team_params.delete :types
      team_params[:region_ids] = team_params[:regions].pluck(:id)
      team_params.delete :regions
      team_params
    end
end

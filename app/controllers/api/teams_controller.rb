class Api::TeamsController < ApplicationController
  require 'jwt'


  before_action :set_team, only: [:show, :update, :destroy]

  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.all
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
    if @team.update(team_savable_params)
      render :show, status: :ok
    else
      render json: @team.errors, status: :unprocessable_entity
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team.destroy
  end

  def auth
    @team = Team.first
    @team.authenticate('pass')
    payload = { teamId: @team.id }
    
    # IMPORTANT: set nil as password parameter
    @token = JWT.encode payload, nil, 'none'
    
    # Set password to nil and validation to false otherwise this won't work
    decoded_token = JWT.decode @token, nil, false
    
    # Array
    # [
    #   {"data"=>"test"}, # payload
    #   {"alg"=>"none"} # header
    # ]
    puts decoded_token

    return @token

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

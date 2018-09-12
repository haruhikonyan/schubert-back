class Api::ConcertsController < ApplicationController
  before_action :authenticate!, only: [:create, :update, :destroy]
  before_action :set_concert, only: [:show, :update, :destroy]

  # GET /concerts
  # GET /concerts.json
  def index
    @concerts = Concert.all
  end

  def concerts_by_team
    team_id = params[:team_id]
    @concerts = Concert.where(team_id: team_id)
    render :index, status: :ok
  end

  # GET /concerts/1
  # GET /concerts/1.json
  def show
  end

  # POST /concerts
  # POST /concerts.json
  def create
    # TODO 既存 team を含めて保存する場合は認証に対応させる
    @concert = Concert.new(concert_savable_params)

    if @concert.save
      render :show, status: :created
    else
      render json: @concert.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /concerts/1
  # PATCH/PUT /concerts/1.json
  def update
    # TODO エラーハンドリングを共通化する
    if @current_team&.id != @concert.team.id
      render json: false, status: :unauthorized
    elsif @concert.update(concert_savable_params)
      render :show, status: :ok
    else
      render json: @concert.errors, status: :unprocessable_entity
    end
  end

  # DELETE /concerts/1
  # DELETE /concerts/1.json
  def destroy
    # TODO エラーハンドリングを共通化する
    if @current_team&.id != @concert.team.id
      render json: false, status: :unauthorized
    else
      @concert.destroy
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_concert
      @concert = Concert.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # 破壊的なのでデバッグ時注意
    def concert_savable_params
      concert_params = params[:concert].try!(:permit!)
      concert_params[:conductor_ids] = concert_params[:conductors].pluck(:id)
      concert_params.delete :conductors
      concert_params[:hole_id] = concert_params[:hole][:id]
      concert_params.delete :hole

      # 曲目
      repertoires_params = concert_params[:repertoires]
      repertoires_params.each do |repertoire_params| 
        # 曲名
        repertoire_params[:tune_id] = repertoire_params[:tune][:id]
        repertoire_params.delete :tune
        # ソリスト
        repertoire_params[:solist_ids] = repertoire_params[:solists].pluck(:id)
        repertoire_params.delete :solists
      end
      concert_params[:repertoires_attributes] = concert_params.delete :repertoires
      team_params = concert_params[:team]
      # tema.id がある場合
      if concert_params[:team][:id].present?
        concert_params[:team_id] = concert_params[:team][:id]
        concert_params.delete :team
      else
        team_params[:type_ids] = team_params[:types].pluck(:id)
        team_params.delete :types
        team_params[:region_ids] = team_params[:regions].pluck(:id)
        team_params.delete :regions
        
        concert_params[:team_attributes] = concert_params.delete :team
      end
      concert_params      
    end
end

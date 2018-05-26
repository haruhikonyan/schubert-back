class Api::RecruitsController < ApplicationController
  before_action :set_recruit, only: [:show, :update, :destroy]

  # GET /recruits
  # GET /recruits.json
  def index
    query = Recruit.is_published
    # type はもしかしたらand検索がいいのか？
    query = query.has_type_ids(params[:type_ids]) if params[:type_ids].present?
    query = query.has_instrument_ids(params[:instrument_ids]) if params[:instrument_ids].present?
    query = query.search_free_word(params[:free_word]) if params[:free_word].present?

    # オフセットに対応させる
    @recruits = query
  end

  # GET /recruits/1
  # GET /recruits/1.json
  def show
  end

  # POST /recruits
  # POST /recruits.json
  def create
    # TODO 既存 team を含めて保存する場合は認証に対応させる
    @recruit = Recruit.new(recruit_savable_params)

    if @recruit.save
      render :show, status: :created
    else
      render json: @recruit.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /recruits/1
  # PATCH/PUT /recruits/1.json
  def update
    if @recruit.update(recruit_savable_params)
      render :show, status: :ok
    else
      render json: @recruit.errors, status: :unprocessable_entity
    end
  end

  # DELETE /recruits/1
  # DELETE /recruits/1.json
  def destroy
    @recruit.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recruit
      @recruit = Recruit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # 破壊的なのでデバッグ時注意
    def recruit_savable_params
      recruit_params = params[:recruit].try!(:permit!)
      recruit_params[:instrument_ids] = recruit_params[:instruments].pluck(:id)
      recruit_params.delete :instruments
      team_params = recruit_params[:team]
      # tema.id がある場合
      if params[:recruit][:team][:id].present?
        recruit_params[:team_id] = params[:recruit][:team][:id]
        recruit_params.delete :team
      else
        team_params[:type_ids] = team_params[:types].pluck(:id)
        team_params.delete :types
        team_params[:region_ids] = team_params[:regions].pluck(:id)
        team_params.delete :regions
        
        recruit_params[:team_attributes] = recruit_params.delete :team
      end
      recruit_params      
    end
end

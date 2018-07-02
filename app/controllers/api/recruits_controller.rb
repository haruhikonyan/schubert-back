class Api::RecruitsController < ApplicationController
  before_action :authenticate!, only: [:update, :destroy]
  before_action :set_recruit, only: [:show, :update, :destroy]

  # GET /recruits
  # GET /recruits.json
  def index
    query = Recruit.is_published
    # type はもしかしたらand検索がいいのか？
    query = query.has_type_ids(params[:type_ids].split(",")) if params[:type_ids].present?
    query = query.has_instrument_ids(params[:instrument_ids].split(",")) if params[:instrument_ids].present?
    query = query.search_free_words(params[:free_words]) if params[:free_words].present?

    # オフセットに対応させる
    @recruits = query.order(updated_at: :desc)
  end

  def search_by_canonical
    cr = CanonicalRoute.find_by(canonical_model_name: params[:canonical_model_name], canonical_id: params[:canonical_id])
    # 公開してるもののみ返すようにする
    @recruits = cr ? cr.search_recruits : []
    render :index, status: :ok
  end

  def recruits_by_team
    team_id = params[:team_id]
    recruits = Recruit.where(team_id: team_id)
    # 認証が成功していたら全ての募集を返して、認証できていなければ公開されてるもののみ返す
    @recruits = @current_team&.id == team_id ? recruits : recruits.is_published
    render :index, status: :ok
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
    # TODO エラーハンドリングを共通化する
    if @current_team&.id != @recruit.team.id
      render json: false, status: :unauthorized
    elsif @recruit.update(recruit_savable_params)
      render :show, status: :ok
    else
      render json: @recruit.errors, status: :unprocessable_entity
    end
  end

  # DELETE /recruits/1
  # DELETE /recruits/1.json
  def destroy
    # TODO エラーハンドリングを共通化する
    if @current_team&.id != @recruit.team.id
      render json: false, status: :unauthorized
    else
      @recruit.destroy
    end
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
      recruit_params[:concert_id] = recruit_params[:concert].present? ? recruit_params[:concert][:id] : nil
      recruit_params.delete :concert
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

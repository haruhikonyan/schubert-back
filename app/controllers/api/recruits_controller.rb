class Api::RecruitsController < ApplicationController
  before_action :set_recruit, only: [:show, :update, :destroy]

  # GET /recruits
  # GET /recruits.json
  def index
    @recruits = Recruit.all
  end

  # GET /recruits/1
  # GET /recruits/1.json
  def show
  end

  # POST /recruits
  # POST /recruits.json
  def create
    @recruit = Recruit.new(recruit_params)

    if @recruit.save
      render :show, status: :created, location: @recruit
    else
      render json: @recruit.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /recruits/1
  # PATCH/PUT /recruits/1.json
  def update
    if @recruit.update(recruit_params)
      render :show, status: :ok, location: @recruit
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
    def recruit_params
      recruit_params = params[:recruit]
      recruit_params[:team_attributes] = recruit_params.delete :team
      recruit_params.try!(:permit!).to_h.transform_keys!(&:underscore)
    end
end

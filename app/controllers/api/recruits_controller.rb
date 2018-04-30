class Api::RecruitsController < ApplicationController
  before_action :snakeize_params, only: [:create]
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
    @recruit.instruments = Instruments.find(params[:instruments])

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
    #def recruit_params
    #  params.fetch(:recruit, {})
    #end
    def recruit_params
      params.require(:recruit).permit(
        :published_from, :published_to,
        { :instruments => [:id, :name] }, :title, :practice_place, :practice_time, :description,
        { :team => [:name, :password, :mail, :url, { :regions => [:id, :name] }, { :types => [:id, :name] }] })
    end
end

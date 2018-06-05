class Api::TunesController < ApplicationController
  before_action :set_tune, only: [:show, :update, :destroy]

  # GET /tunes
  # GET /tunes.json
  def index
    @tunes = Tune.all
  end

  # GET /tunes/1
  # GET /tunes/1.json
  def show
  end

  # POST /tunes
  # POST /tunes.json
  def create
    @tune = Tune.new(tune_params)

    if @tune.save
      render :show, status: :created, location: @tune
    else
      render json: @tune.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tunes/1
  # PATCH/PUT /tunes/1.json
  def update
    if @tune.update(tune_params)
      render :show, status: :ok, location: @tune
    else
      render json: @tune.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tunes/1
  # DELETE /tunes/1.json
  def destroy
    @tune.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tune
      @tune = Tune.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tune_params
      params.fetch(:tune, {})
    end
end

class Api::ConductorsController < ApplicationController
  before_action :set_conductor, only: [:show, :update, :destroy]

  # GET /conductors
  # GET /conductors.json
  def index
    @conductors = Conductor.all
  end

  # GET /conductors/1
  # GET /conductors/1.json
  def show
  end

  # POST /conductors
  # POST /conductors.json
  def create
    @conductor = Conductor.new(conductor_params)

    if @conductor.save
      render :show, status: :created, location: @conductor
    else
      render json: @conductor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /conductors/1
  # PATCH/PUT /conductors/1.json
  def update
    if @conductor.update(conductor_params)
      render :show, status: :ok, location: @conductor
    else
      render json: @conductor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /conductors/1
  # DELETE /conductors/1.json
  def destroy
    @conductor.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conductor
      @conductor = Conductor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def conductor_params
      params.fetch(:conductor, {})
    end
end

class Api::HolesController < ApplicationController
  before_action :set_hole, only: [:show, :update, :destroy]

  # GET /holes
  # GET /holes.json
  def index
    @holes = Hole.all
  end

  # GET /holes/1
  # GET /holes/1.json
  def show
  end

  # POST /holes
  # POST /holes.json
  def create
    @hole = Hole.new(hole_params)

    if @hole.save
      render :show, status: :created, location: @hole
    else
      render json: @hole.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /holes/1
  # PATCH/PUT /holes/1.json
  def update
    if @hole.update(hole_params)
      render :show, status: :ok, location: @hole
    else
      render json: @hole.errors, status: :unprocessable_entity
    end
  end

  # DELETE /holes/1
  # DELETE /holes/1.json
  def destroy
    @hole.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hole
      @hole = Hole.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hole_params
      params.fetch(:hole, {})
    end
end

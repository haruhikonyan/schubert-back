class Api::ComposersController < ApplicationController
  before_action :set_composer, only: [:show, :update, :destroy]

  # GET /composers
  # GET /composers.json
  def index
    @composers = Composer.all
  end

  # GET /composers/1
  # GET /composers/1.json
  def show
  end

  # POST /composers
  # POST /composers.json
  def create
    @composer = Composer.new(composer_params)

    if @composer.save
      render :show, status: :created, location: @composer
    else
      render json: @composer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /composers/1
  # PATCH/PUT /composers/1.json
  def update
    if @composer.update(composer_params)
      render :show, status: :ok, location: @composer
    else
      render json: @composer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /composers/1
  # DELETE /composers/1.json
  def destroy
    @composer.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_composer
      @composer = Composer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def composer_params
      params.fetch(:composer, {})
    end
end

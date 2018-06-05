class Api::RepertoiresController < ApplicationController
  before_action :set_repertoire, only: [:show, :update, :destroy]

  # GET /repertoires
  # GET /repertoires.json
  def index
    @repertoires = Repertoire.all
  end

  # GET /repertoires/1
  # GET /repertoires/1.json
  def show
  end

  # POST /repertoires
  # POST /repertoires.json
  def create
    @repertoire = Repertoire.new(repertoire_params)

    if @repertoire.save
      render :show, status: :created, location: @repertoire
    else
      render json: @repertoire.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /repertoires/1
  # PATCH/PUT /repertoires/1.json
  def update
    if @repertoire.update(repertoire_params)
      render :show, status: :ok, location: @repertoire
    else
      render json: @repertoire.errors, status: :unprocessable_entity
    end
  end

  # DELETE /repertoires/1
  # DELETE /repertoires/1.json
  def destroy
    @repertoire.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_repertoire
      @repertoire = Repertoire.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def repertoire_params
      params.fetch(:repertoire, {})
    end
end

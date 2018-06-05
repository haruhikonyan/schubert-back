class Api::SolistsController < ApplicationController
  before_action :set_solist, only: [:show, :update, :destroy]

  # GET /solists
  # GET /solists.json
  def index
    @solists = Solist.all
  end

  # GET /solists/1
  # GET /solists/1.json
  def show
  end

  # POST /solists
  # POST /solists.json
  def create
    @solist = Solist.new(solist_params)

    if @solist.save
      render :show, status: :created, location: @solist
    else
      render json: @solist.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /solists/1
  # PATCH/PUT /solists/1.json
  def update
    if @solist.update(solist_params)
      render :show, status: :ok, location: @solist
    else
      render json: @solist.errors, status: :unprocessable_entity
    end
  end

  # DELETE /solists/1
  # DELETE /solists/1.json
  def destroy
    @solist.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_solist
      @solist = Solist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def solist_params
      params.fetch(:solist, {})
    end
end

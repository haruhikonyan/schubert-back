class Api::CanonicalRoutesController < ApplicationController
  before_action :set_canonical_route, only: [:show, :update, :destroy, :search_recruits]

  # GET /canonical_routes
  # GET /canonical_routes.json
  def index
    @canonical_routes = CanonicalRoute.all
  end

  def search_recruits
    @recruits = @canonical_route.search_recruits
    render 'api/recruits/index', status: :ok
  end

  # GET /canonical_routes/1
  # GET /canonical_routes/1.json
  def show
  end

  # POST /canonical_routes
  # POST /canonical_routes.json
  def create
    @canonical_route = CanonicalRoute.new(canonical_route_params)

    if @canonical_route.save
      render :show, status: :created, location: @canonical_route
    else
      render json: @canonical_route.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /canonical_routes/1
  # PATCH/PUT /canonical_routes/1.json
  def update
    if @canonical_route.update(canonical_route_params)
      render :show, status: :ok, location: @canonical_route
    else
      render json: @canonical_route.errors, status: :unprocessable_entity
    end
  end

  # DELETE /canonical_routes/1
  # DELETE /canonical_routes/1.json
  def destroy
    @canonical_route.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_canonical_route
      @canonical_route = CanonicalRoute.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def canonical_route_params
      params.fetch(:canonical_route, {})
    end
end

class Api::InstrumentCategoriesController < ApplicationController
  before_action :set_instrument_category, only: [:show, :update, :destroy]

  # GET /instrument_categories
  # GET /instrument_categories.json
  def index
    @instrument_categories = InstrumentCategory.all
  end

  # GET /instrument_categories/1
  # GET /instrument_categories/1.json
  def show
  end

  # POST /instrument_categories
  # POST /instrument_categories.json
  def create
    @instrument_category = InstrumentCategory.new(instrument_category_params)

    if @instrument_category.save
      render :show, status: :created, location: @instrument_category
    else
      render json: @instrument_category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /instrument_categories/1
  # PATCH/PUT /instrument_categories/1.json
  def update
    if @instrument_category.update(instrument_category_params)
      render :show, status: :ok, location: @instrument_category
    else
      render json: @instrument_category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /instrument_categories/1
  # DELETE /instrument_categories/1.json
  def destroy
    @instrument_category.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instrument_category
      @instrument_category = InstrumentCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instrument_category_params
      params.fetch(:instrument_category, {})
    end
end

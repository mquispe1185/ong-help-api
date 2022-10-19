class FixedCostsController < ApplicationController
  before_action :set_fixed_cost, only: [:show, :update, :destroy]

  # GET /fixed_costs
  def index
    @fixed_costs = FixedCost.all

    render json: @fixed_costs
  end

  # GET /fixed_costs/1
  def show
    render json: @fixed_cost
  end

  # POST /fixed_costs
  def create
    @fixed_cost = FixedCost.new(fixed_cost_params)

    if @fixed_cost.save
      render json: @fixed_cost, status: :created, location: @fixed_cost
    else
      render json: @fixed_cost.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /fixed_costs/1
  def update
    if @fixed_cost.update(fixed_cost_params)
      render json: @fixed_cost
    else
      render json: @fixed_cost.errors, status: :unprocessable_entity
    end
  end

  # DELETE /fixed_costs/1
  def destroy
    @fixed_cost.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fixed_cost
      @fixed_cost = FixedCost.find(params[:id])
    end

    def fixed_cost_params
      params.require(:fixed_cost).permit(:title, :description, :mount, :month, :year)
    end
end

class FixedCostsController < ApplicationController
  before_action :set_fixed_cost, only: [:show, :update, :destroy]

  # GET /fixed_costs
  def index
    
    case params[:type]
    when 'Ong'
      result = Ong.find(params[:id])
    when 'Campaign'
      result = Campaign.find(params[:id])
    end

    @fixed_costs = result.fixed_costs

    render json: @fixed_costs
  end

  # GET /fixed_costs/1
  def show
    render json: @fixed_cost
  end

  # POST /fixed_costs
  def create
    @fixed_cost = FixedCost.new(fixed_cost_params)
    @fixed_cost.created_by_id = current_user.id
    @fixed_cost.status_updated_by_id = current_user.id

    period = Period.find_or_create_by(month: params[:period][:month], year: params[:period][:year])
    @fixed_cost.period = period

    if @fixed_cost.save
      render json: @fixed_cost, status: :created, location: @fixed_cost
    else
      render json: @fixed_cost.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /fixed_costs/1
  def update
    period = Period.find_or_create_by(month: params[:period][:month], year: params[:period][:year])
    if @fixed_cost.update(fixed_cost_params)
      @fixed_cost.period = period
      @fixed_cost.save
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
      params.require(:fixed_cost).permit(:title, :description, :mount, :period_id, :chargeable_id, :chargeable_type)
    end
end

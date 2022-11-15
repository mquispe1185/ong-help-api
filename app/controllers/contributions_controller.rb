class ContributionsController < ApplicationController
  before_action :set_contribution, only: [:show, :update, :destroy]

  # GET /contributions
  def index

    case params[:type]
    when 'Ong'
      result = Ong.find(params[:id])
    when 'Campaign'
      result = Campaign.find(params[:id])
    end

    @contributions = result.contributions

    render json: @contributions
  end

  # GET /contributions/1
  def show
    render json: @contribution
  end

  # POST /contributions
  def create
    @contribution = Contribution.new(contribution_params)

    if @contribution.save
      render json: @contribution, status: :created, location: @contribution
    else
      render json: @contribution.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contributions/1
  def update
    if @contribution.update(contribution_params)
      render json: @contribution
    else
      render json: @contribution.errors, status: :unprocessable_entity
    end
  end

  # DELETE /contributions/1
  def destroy
    @contribution.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contribution
      @contribution = Contribution.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contribution_params
      params.require(:contribution).permit(:item_donation_id, :user_id, :mount, :status, :code, :status_updated_by_id)
    end
end

class ItemDonationsController < ApplicationController
  before_action :set_item_donation, only: [:show, :update, :destroy]

  # GET /item_donations
  def index

    case params[:type]
    when 'Ong'
      result = Ong.find(params[:id])
    when 'Campaign'
      result = Campaign.find(params[:id])
    end

    @item_donations = result.item_donations

    render json: @item_donations
  end

  # GET /item_donations/1
  def show
    render json: @item_donation
  end

  # POST /item_donations
  def create
    @item_donation = ItemDonation.new(item_donation_params)
    @item_donation.created_by_id = current_user.id
    @item_donation.status_updated_by_id = current_user.id
    # harcoded, to be added in frontend
    @item_donation.period = Period.first

    if @item_donation.save
      render json: @item_donation, status: :created, location: @item_donation
    else
      render json: @item_donation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /item_donations/1
  def update
    if @item_donation.update(item_donation_params)
      render json: @item_donation
    else
      render json: @item_donation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /item_donations/1
  def destroy
    @item_donation.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_donation
      @item_donation = ItemDonation.find(params[:id])
    end

    def item_donation_params
      params.require(:item_donation).permit(:title, :description, :mount, :month, :year)
    end
end

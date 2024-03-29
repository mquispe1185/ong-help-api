class DonationsController < ApplicationController
  before_action :set_donation, only: [:show, :update, :destroy]

  # GET /donations
  def index

    case params[:type]
    when 'Ong'
      result = Ong.find(params[:id])
    when 'Campaign'
      result = Campaign.find(params[:id])
    end

    @donations = result.donations

    render json: @donations
  end

  # GET /donations/1
  def show
    render json: @donation
  end

  # POST /donations
  def create
    @donation = Donation.new(donation_params)

    if @donation.save
      render json: @donation, status: :created, location: @donation
    else
      render json: @donation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /donations/1
  def update
    if @donation.update(donation_params)
      render json: @donation
    else
      render json: @donation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /donations/1
  def destroy
    @donation.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_donation
      @donation = Donation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def donation_params
      params.fetch(:donation, {})
    end
end

class CampaignsController < ApplicationController
  before_action :set_campaign, only: [:show, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  # GET /campaigns
  def index
    @campaigns = Campaign.all

    render json: @campaigns
  end

  # GET /campaigns/1
  def show
    render json: @campaign, serializer: FullCampaignSerializer
  end

  # GET /campaigns/user_campaigns
  def user_campaigns
    @campaigns = current_user.campaigns
    render json: @campaigns, each_serializer: ShortCampaignSerializer
  end

  # POST /campaigns
  def create
    @campaign = current_user.campaigns.new(campaign_params)
    @campaign.updated_by = current_user
    
    if @campaign.save
      render json: @campaign, status: :created, location: @campaign
    else
      render json: @campaign.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /campaigns/1
  def update
    @campaign.updated_by = current_user

    if @campaign.update(campaign_params)
      render json: @campaign
    else
      render json: @campaign.errors, status: :unprocessable_entity
    end
  end

  # DELETE /campaigns/1
  def destroy
    @campaign.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campaign
      @campaign = Campaign.find(params[:id])
    end

    def campaign_params
      params.require(:campaign).permit(:name, :description, :city_id, :province_id, :phone, :email, :facebook, :instagram, :twitter, :category_id, :tags, :video_url)
    end
end

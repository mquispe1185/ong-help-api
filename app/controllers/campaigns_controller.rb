class CampaignsController < ApplicationController
  before_action :set_campaign, only: [:show, :update, :destroy, :set_photos, :delete_photo]
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
  # new path for user's dropdown with basic campaign info
  def user_campaigns
    @campaigns = current_user.campaigns
    render json: @campaigns, each_serializer: ShortCampaignSerializer
  end

  # POST /campaigns
  def create
    @campaign = current_user.campaigns.new(campaign_params)
    @campaign.updated_by = current_user
    
    if @campaign.save
      render json: @campaign, serializer: ShortCampaignSerializer
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

  def set_photos
    @campaign.photos.attach(params[:photos])
    #@campaign.update(url_photo: "#{ENV['BASE_URL_IMG']}#{@campaign.photos.first.key}")
    render json: @campaign, serializer: ShortCampaignSerializer
  end

  def delete_photo
    photo = ActiveStorage::Attachment.find(params[:photo_id])
    if photo
      photo.purge
      render json: @campaign, serializer: ShortCampaignSerializer
    else
      render json: @campaign.errors.full_messages, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campaign
      @campaign = Campaign.find(params[:id])
    end

    def campaign_params
      params.require(:campaign).permit(:name, :description, :city_id, :province_id, :phone, :email, :facebook, :instagram, :twitter, :category_id, :tags, :video_url, photos: [])
    end
end

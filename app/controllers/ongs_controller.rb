class OngsController < ApplicationController
  before_action :set_ong, only: [:show, :update, :destroy, :set_photos, :delete_photo]
  skip_before_action :authenticate_user!, only: [:index, :show]

  # GET /ongs
  def index
    @ongs = Ong.all

    render json: @ongs
  end

  # GET /ongs/1
  def show
    render json: @ong, serializer: FullOngSerializer
  end

  # GET /ongs/user_ongs
  # new path for user's dropdown with basic ong info
  def user_ongs
    @ongs = current_user.ongs
    render json: @ongs, each_serializer: ShortOngSerializer
  end

  # POST /ongs
  def create
    @ong = current_user.ongs.new(ong_params)
    @ong.updated_by = current_user
    
    if @ong.save
      render json: @ong, serializer: ShortOngSerializer
    else
      render json: @ong.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ongs/1
  def update
    @ong.updated_by = current_user

    if @ong.update(ong_params)
      render json: @ong, serializer: FullOngSerializer
    else
      render json: @ong.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ongs/1
  def destroy
    @ong.destroy
  end

  def set_photos
    @ong.photos.attach(params[:photos])
    #@ong.update(url_photo: "#{ENV['BASE_URL_IMG']}#{@ong.photos.first.key}")
    render json: @ong, serializer: ShortOngSerializer
  end

  def delete_photo
    photo = ActiveStorage::Attachment.find(params[:photo_id])
    if photo
      photo.purge
      render json: @ong, serializer: ShortOngSerializer
    else
      render json: @ong.errors.full_messages, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ong
      @ong = Ong.find(params[:id])
    end

    def ong_params
      params.require(:ong).permit(:name, :description, :city_id, :province_id, :phone, :email, :facebook, :instagram, :twitter, :category_id, :tags, :video_url, photos: [])
    end
end

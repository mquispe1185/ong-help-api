class OngsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ong, only: [:show, :update, :destroy]
  def index
    @ongs = Ong.all
    render json: @ongs
  end

  def show
    render json: @ong
  end

  def create
    @ong = Ong.new(ong_params)
    if @ong.save
      render json: @ong, status: :created
    else
      render json: @ong.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    if @ong.update(ong_params)
      render json: @ong
    else
      render json: @ong.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @ong.destroy
    render json: Ong.all
  end

  def set_ong
    @ong = Ong.find(params[:id])
  end

  private

  def ong_params
    params.require(:ong).permit(:name, :description, :street, :city_id, :province_id,
                                :phone, :email, :facebook, :instagram, :twitter, :longitude,
                                :latitude, :user_id, :category_id, :tags, :status_updated_by_id)
  end
end

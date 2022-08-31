class OngsController < ApplicationController
  before_action :set_ong, only: [:show, :update, :destroy]

  # GET /ongs
  def index
    @ongs = Ong.all

    render json: @ongs
  end

  # GET /ongs/1
  def show
    render json: @ong
  end

  # POST /ongs
  def create
    @ong = Ong.new(ong_params)

    if @ong.save
      render json: @ong, status: :created, location: @ong
    else
      render json: @ong.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ongs/1
  def update
    if @ong.update(ong_params)
      render json: @ong
    else
      render json: @ong.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ongs/1
  def destroy
    @ong.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ong
      @ong = Ong.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ong_params
      params.fetch(:ong, {})
    end
end

class EntityLinksController < ApplicationController
  before_action :set_entity_link, only: [:show, :update, :destroy]

  # GET /entity_links
  def index

    case params[:type]
    when 'Ong'
      result = Ong.find(params[:id])
    when 'Campaign'
      result = Campaign.find(params[:id])
    end

    @entity_links = result.entity_links

    render json: @entity_links
  end

  # GET /entity_links/1
  def show
    #render json: @entity_link
    result = Metapage.fetch(@entity_link.url).to_h
    render json: result
  end

  # POST /entity_links
  def create
    @entity_link = EntityLink.new(entity_link_params)

    if @entity_link.save
      render json: @entity_link, status: :created, location: @entity_link
    else
      render json: @entity_link.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /entity_links/1
  def update
    if @entity_link.update(entity_link_params)
      render json: @entity_link
    else
      render json: @entity_link.errors, status: :unprocessable_entity
    end
  end

  # DELETE /entity_links/1
  def destroy
    @entity_link.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entity_link
      @entity_link = EntityLink.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def entity_link_params
      params.require(:entity_link).permit(:url, :linkeable_id, :linkeable_type)
    end
end

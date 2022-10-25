class SearchController < ApplicationController
  skip_before_action :authenticate_user!

  # searchbar
  # params[:q]
  def index
    result = []
    ongs = Ong.search(params[:q])
    cams = Campaign.search(params[:q])
    result += ongs.map{|o| {id: o.id, name: o.name, type: o.class.name}}
    result += cams.map{|c| {id: c.id, name: c.name, type: c.class.name}}
    render json: result
  end

  def create
  end

  # entities for landing page
  def init_entities
    result = []
    ongs = Ong.take(2)
    cams = Campaign.take(2)
    result += ongs.map{|o| {id: o.id, name: o.name, description: o.description, video_url: o.video_url, type: o.class.name}}
    result += cams.map{|c| {id: c.id, name: c.name, description: c.description, video_url: c.video_url, type: c.class.name}}
    render json: result
  end

end

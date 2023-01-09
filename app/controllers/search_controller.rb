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
    ongs = Ong.all.sample(3)
    cams = Campaign.all.sample(2)
    result += ongs.map{|o| {id: o.id, name: o.name, description: o.description, video_url: o.video_url, type: o.class.name, facebook: o.facebook, twitter: o.twitter, instagram: o.instagram, photos: o.photos_dev}}
    result += cams.map{|c| {id: c.id, name: c.name, description: c.description, video_url: c.video_url, type: c.class.name, facebook: c.facebook, twitter: c.twitter, instagram: c.instagram, photos: c.photos_dev}}
    render json: result
  end

end

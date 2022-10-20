class SearchController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  # params[:q]
  def index
    result = []
    ongs = Ong.search(params[:q])
    cams = Campaign.search(params[:q])
    result << ongs.map{|o| {id: o.id, name: o.name, type: o.class.name}}
    result << cams.map{|c| {id: c.id, name: c.name, type: c.class.name}}
    render json: result
  end

end

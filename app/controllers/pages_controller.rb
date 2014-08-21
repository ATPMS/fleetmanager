class PagesController < ApplicationController
  before_filter :authenticate_user!
  def index
    @vessels = Vessel.where(user_id: current_user.id)
  end

  def traffic_volume
  end

  def get_traffic_volume
    @volume = HTTParty.get("http://54.255.138.181:4242/api/longtermdistribution/distribution/").body

    render json: @volume
  end
end

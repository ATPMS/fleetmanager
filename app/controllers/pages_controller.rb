class PagesController < ApplicationController
  before_filter :authenticate_user!
  def index
    @vessels = Vessel.where(user_id: current_user.id)
  end
end

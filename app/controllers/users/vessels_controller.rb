module Users
  class VesselsController < ApplicationController

    before_filter :authenticate_user!

    layout :resolve_layout
    
    def index
      @vessels = Vessel.where(user_id: current_user.id)
    end

    def new
      @vessel = Vessel.new
    end

    def create
      @vessel = Vessel.new(permit_params)
      @vessel.user = current_user

      if @vessel.save
        flash.now[:success] = "Successfully saved vessel"
        redirect_to users_vessel_path(@vessel)
      else
        flash[:error] = "There was an error in saving a vessel"
        render :new
      end
    end

    def edit
      @vessel = Vessel.find(params[:id])
    end

    def update
      @vessel = Vessel.find(params[:id])

      if @vessel.update(permit_params)
        flash.now[:success] = "Successfully saved vessel"
        redirect_to users_vessel_path(@vessel)
      else
        flash[:error] = "There was an error in saving a vessel"
        render :edit
      end
    end

    def show
      @vessel = Vessel.find(params[:id]) 
      @vessels = [@vessel]

      if @vessel.logs.count == 0
        flash.now[:error] = "No logs for this vessel"
      end
    end

    def map
      @vessels = current_user.vessels
    end

    private

    def permit_params
      params.require(:vessel).permit!
    end

    def resolve_layout
      case action_name
      when "map"
        "application"
      else
        "application"
      end
    end

  end
end

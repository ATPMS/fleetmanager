module Account
  class VesselsController < ApplicationController

    before_filter :authenticate_user!

    layout :resolve_layout
    
    def index
      @vessels = Vessel.where(user_id: current_user.id).order("created_at DESC")

      if params[:q].present?
        @q = params[:q]
        @vessels = @vessels.where("vessels.name LIKE :q OR vessels.code LIKE :q OR vessels.reference_number LIKE :q", q: "%#{@q}%")
      end

      @vessels = @vessels.page(params[:page]).per(10)
    end

    def real_time
      @vessel = Vessel.find(params[:id])
    end

    def tracking_history
      @vessel = Vessel.find(params[:id])
    end

    def new
      @vessel = Vessel.new
    end

    def create
      @vessel = Vessel.new(permit_params)
      @vessel.user = current_user

      if @vessel.save
        flash.now[:success] = "Successfully saved vessel"
        redirect_to account_vessel_path(@vessel)
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
        redirect_to account_vessel_path(@vessel)
      else
        flash[:error] = "There was an error in saving a vessel"
        render :edit
      end
    end

    def show
      @vessel = Vessel.find(params[:id]) 
      @vessels = [@vessel]
    end

    def map
      @vessels = []

      if request.post?
        @vessels = Vessel.where("vessels.id IN (?)", params[:vessel_ids])
      end
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

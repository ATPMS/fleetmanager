module Vessels
  class CrewsController < ApplicationController

    before_filter :authenticate_user!, :load_defaults

    def index
      @crews = Crew.where(vessel_id: @vessel.id)

      if params[:q].present?
        @q = params[:q]
        @crews = @crews.where("first_name LIKE :q OR last_name LIKE :q", q: "%#{@q}%")
      end
    end

    def new
      @crew = Crew.new
    end

    def create
      @crew  = Crew.new(crew_params)
      @crew.vessel = @vessel

      if @crew.save
        flash[:success] = "Successfully saved crew record"
        redirect_to vessel_crews_path(@vessel)
      else
        flash[:error] = "Error in saving crew record"
        render :new
      end
    end

    def edit
      @crew = Crew.find(params[:id])
    end

    def update
      @crew = Crew.find(params[:id])

      if @crew.update(crew_params)
        flash[:success] = "Successfully saved crew record"
        redirect_to vessel_crews_path(@vessel)
      else
        flash[:error] = "Error in saving crew record"
        render :error
      end
    end

    def destroy
      @crew = Crew.find(params[:id])
      @crew.destroy!
      flash[:success] = "Successfully deleted crew record"
      redirect_to vessel_crews_path(@vessel)
    end

    private

    def crew_params
      params.require(:crew).permit!
    end

    def load_defaults
      @vessel = Vessel.find(params[:vessel_id])
    end
  end
end

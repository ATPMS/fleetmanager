module Account
  class VesselMaintenancesController < ApplicationController

    def index
      @vessel_maintenances = VesselMaintenance.user_vessel_maintenances(current_user).page(params[:page]).per(10)
    end

    def show
      @vessel_maintenance = VesselMaintenance.find(params[:id])
    end

    def new
      @vessels = Vessel.user_vessels(current_user)
      @vessel_maintenance = VesselMaintenance.new

      if params[:vessel_id].present?
        @vessel_maintenance.vessel = Vessel.find(params[:vessel_id])
      end
    end

    def create
      @vessel_maintenance = VesselMaintenance.new(vessel_maintenance_params)
      @vessels = Vessel.user_vessels(current_user)

      if @vessel_maintenance.save
        flash[:success] = "Successfully saved maintenance record"
        redirect_to account_vessel_path(@vessel_maintenance.vessel)
      else
        flash.now[:error] = "Error in saving maintenance record"
        render :new
      end
    end

    def edit
      @vessels = Vessel.user_vessels(current_user)
      @vessel_maintenance = VesselMaintenance.find(params[:id])

      if params[:vessel_id].present?
        @vessel_maintenance.vessel = Vessel.find(params[:vessel_id])
      end
    end

    def update
      @vessel_maintenance = VesselMaintenance.find(params[:id])
      @vessels = Vessel.user_vessels(current_user)

      if @vessel_maintenance.update(vessel_maintenance_params)
        flash[:success] = "Successfully saved maintenance record"
        redirect_to account_vessel_path(@vessel_maintenance.vessel)
      else
        flash.now[:error] = "Error in saving maintenance record"
        render :edit
      end
    end

    def destroy
      @vessel_maintenance = VesselMaintenance.find(params[:id])
      @vessel_maintenance.destroy
      flash[:success] = "Successfully deleted maintenance record"
      redirect_to account_vessel_maintenances_path
    end
    
    private

    def vessel_maintenance_params
      params.require(:vessel_maintenance).permit!
    end
  end
end

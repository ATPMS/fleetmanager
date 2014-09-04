module Vessels
  class VesselMaintenancesController < ApplicationController

    before_filter :authenticate_user!, :load_defaults

    def index
      @vessel_maintenances = VesselMaintenance.where(vessel_id: @vessel.id).order(:date_of_maintenance)

      if params[:status].present?
        @status = params[:status]
        @vessel_maintenances = @vessel_maintenances.where(status: @status)
      end

      if params[:service_company_id].present?
        @service_company = ServiceCompany.find(params[:service_company_id])
        @vessel_maintenances = @vessel_maintenances.where(service_company_id: @service_company)
      end

      if params[:maintenance_type_id].present?
        @maintenance_type = MaintenanceType.find(params[:maintenance_type_id])
        @vessel_maintenances = @vessel_maintenances.where(maintenance_type_id: @maintenance_type)
      end

      @vessel_maintenances = @vessel_maintenances.page(params[:page]).per(10)
    end

    def new
      @vessel_maintenance = VesselMaintenance.new
    end

    def create
      @vessel_maintenance  = VesselMaintenance.new(crew_params)
      @vessel_maintenance.vessel = @vessel

      if @vessel_maintenance.save
        flash[:success] = "Successfully saved maintenance record"
        redirect_to vessel_vessel_maintenances_path(@vessel)
      else
        flash[:error] = "Error in saving maintenance record"
        render :new
      end
    end

    def edit
      @vessel_maintenance = VesselMaintenance.find(params[:id])
    end

    def update
      @vessel_maintenance = VesselMaintenance.find(params[:id])

      if @vessel_maintenance.update(crew_params)
        flash[:success] = "Successfully saved maintenance record"
        redirect_to vessel_vessel_maintenances_path(@vessel)
      else
        flash[:error] = "Error in saving maintenance record"
        render :error
      end
    end

    def destroy
      @vessel_maintenance = VesselMaintenance.find(params[:id])
      @vessel_maintenance.destroy!
      flash[:success] = "Successfully deleted maintenance record"
      redirect_to vessel_vessel_maintenances_path(@vessel)
    end


    private

    def vessel_maintenance_params
      params.require(:vessel_maintenance).permit!
    end

    def load_defaults
      @vessel = Vessel.find(params[:vessel_id])
    end
  end
end

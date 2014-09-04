class VesselMaintenancesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @vessel_maintenances = VesselMaintenance.user_vessel_maintenances(current_user)
    
    if params[:vessel_id].present?
      @vessel = Vessel.find(params[:vessel_id])
      @vessel_maintenances = @vessel_maintenances.where(vessel_id: @vessel.id)
    end

    if params[:status].present?
      @status = params[:status]
      @vessel_maintenances = @vessel_maintenances.where(status: @status)
    end
    
    @vessel_maintenances = @vessel_maintenances.page(params[:page]).per(10)
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
      redirect_to vessel_vessel_maintenances_path(@vessel_maintenance.vessel)
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
      redirect_to vessel_vessel_maintenances_path(@vessel_maintenance.vessel)
    else
      flash.now[:error] = "Error in saving maintenance record"
      render :edit
    end
  end

  def destroy
    @vessel_maintenance = VesselMaintenance.find(params[:id])
    id = @vessel_maintenances.id
    @vessel_maintenance.destroy
    flash[:success] = "Successfully deleted maintenance record"
    redirect_to vessel_vessel_maintenances_path(id)
  end
  
  private

  def vessel_maintenance_params
    params.require(:vessel_maintenance).permit!
  end
end

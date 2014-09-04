module Api
  class VesselMaintenancesController < ApiController
    def vessel_chart_data
      start_date = params[:start_date]
      end_date = params[:end_date]
      vessel_id = params[:vessel_id]

      vessel = Vessel.find(vessel_id)
    end
  end
end

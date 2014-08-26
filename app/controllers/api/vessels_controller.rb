module Api
  class VesselsController < ApiController

    def get_logs
      vessel = Vessel.where(access_token: params[:access_token]).first

      if vessel.nil?
        render json: "Not found"
      else
        start_datetime = params[:start_datetime] ||= Time.now - 30.days
        end_datetime = params[:end_datetime] ||= Time.now
        render json: vessel.logs.where(logged_at: start_datetime..end_datetime).order("logged_at DESC").group_by { |l| l.session_token };
      end
    end

    def last_location
      vessel = Vessel.where(access_token: params[:access_token]).first

      if vessel.nil?
        render json: "Not found"
      elsif vessel.logs.count > 0
        entry = vessel.logs.last
        render json: entry.to_json
      else
        render json: {}
      end
    end

    def save_logs
      #vessel = Vessel.where(access_token: params[:access_token]).first
      id = params[:id]
      logs = params[:logs]
      logs.each do |l|
        new_log = Log.new    
        new_log.lon = l["lon"]
        new_log.lat = l["lat"]
        new_log.logged_at = l["logged_at"]
        new_log.session_token = l["session_token"]
        new_log.vessel_id = id
        new_log.save!
        #vessel.logs << new_log
      end

      render json: "Ok"
    end
  end
end

module Api
  class VesselsController < ApiController
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
      vessel = Vessel.where(access_token: params[:access_token]).first

      if vessel.nil?
        render json: "No such vessel #{params[:access_token]}"
      else
        logs = JSON.parse(params[:logs])
        logs.each do |l|
          new_log = Log.new    
          new_log.lon = l["lon"]
          new_log.lat = l["lat"]
          new_log.logged_at = l["logged_at"]
          new_log.session_token = l["session_token"]
          vessel.logs << new_log
        end

        Vessel.transaction do
          vessel.save!
        end

        render json: "Vessel logs count: #{vessel.logs.count}"
      end
    end
  end
end

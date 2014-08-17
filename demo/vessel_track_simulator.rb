require 'httparty'
require 'securerandom'

puts "Demo for Fleet Management v0.1"
puts "=============================="

API_ENDPOINT_SAVE_LOGS = "http://106.186.124.150:8082/api/vessels/logs/save"
VESSEL_ACCESS_TOKEN = ARGV.first
SESSION_TOKEN = SecureRandom.hex(4)

lower_lat = 14.5
upper_lat = 14.6

lower_lon = 120.9
upper_lon = 121.1


while true do
  locations = []

  lon = rand * (upper_lon - lower_lon) + lower_lon
  lat = rand * (upper_lat - lower_lat) + lower_lat

  log = { lon: lon, lat: lat, logged_at: Time.now.to_s, session_token: SESSION_TOKEN }
  locations.push(log)
  puts locations.inspect

  res = Net::HTTP.post_form(URI(API_ENDPOINT_SAVE_LOGS), { logs: locations.to_json, access_token: VESSEL_ACCESS_TOKEN })

  puts res.body.inspect

  sleep(1)
end

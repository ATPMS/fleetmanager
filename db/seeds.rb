# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

AdminUser.create(email: "admin@example.com", password: "password", password_confirmation: "password")

MaintenanceType.create(name: "Change Oil", code: "CHANGE OIL")
MaintenanceType.create(name: "Change Tires", code: "CHANGE TIRES")

# Create two users
user_a = User.create(email: "user.a@example.com", password: "password", password_confirmation: "password", first_name: "User A", last_name: "Example", company_name: "Sample Company A")
user_b = User.create(email: "user.b@example.com", password: "password", password_confirmation: "password", first_name: "User B", last_name: "Example", company_name: "Sample Company B")

# Create 200 vessels for user_a
200.times do |i|
  v = Vessel.create(name: "Vessel A#{i}", code: "VESSEL_A_#{i}", reference_number: "VESSEL_A_#{i}_REF", user_id: user_a.id)
  puts v.inspect
end

# Create 200 vessels for user_b
200.times do |i|
  v = Vessel.create(name: "Vessel B#{i}", code: "VESSEL_B_#{i}", reference_number: "VESSEL_B_#{i}_REF", user_id: user_b.id)
  puts v.inspect
end

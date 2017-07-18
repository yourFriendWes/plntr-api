require 'csv'
require_relative '../app/models/zipcode'
require_relative '../app/models/zone'
require_relative '../app/models/plant'

# # seeding for zipcodes
# zipcodes = []
#
# ["db/seeds/phm_ak_zipcode.csv", "db/seeds/phm_hi_zipcode.csv", "db/seeds/phm_pr_zipcode.csv", "db/seeds/phm_us_zipcode.csv"].each do |file|
#   CSV.foreach(file, { :headers => true }) do |line|
#     zipcodes << { zip: line[0], phzone: line[1], temp_range: line[2] }
#   end
# end
#
# success_count = 0
#
# zipcodes.each do |zipcode|
#   temp = Zipcode.create!(zipcode)
#   if temp.id
#     success_count += 1
#     puts "Successfully added. ZIP: #{temp.zip} Zone: #{temp.phzone}"
#   end
# end
#
# puts "#{success_count} out of #{zipcodes.length} successfully added"
#
# # seeding for zones
# zones = []
#
# CSV.foreach("db/seeds/zones_main.csv", { :headers => true }) do |line|
#   zones << { main_zone: line[0], lowest_avg_temp_from: line[1].to_i, lowest_avg_temp_to: line[1].to_i + 10, description: "N/A" }
# end
#
# success_count = 0
#
# zones.each do |zone|
#   temp = Zone.create!(zone)
#   if temp.id
#     success_count += 1
#     puts "Successfully added. main_zone: #{temp.main_zone}, lowest_avg_temp_from: #{temp.lowest_avg_temp_from}, lowest_avg_temp_to: #{temp.lowest_avg_temp_to}, description: #{temp.description}"
#   end
# end
#
# puts "#{success_count} out of #{zones.length} successfully added"


# seeding for zones
plants = []

CSV.foreach("db/seeds/plant_data.csv", { :headers => true }) do |line|
  plants << { plant_type: line[0], name: line[1], sun_exposure: line[2], soil_ph: line[3], soil_type: line[4], soil_drainage: line[5], water_requirement: line[6], row_spacing: line[7], plant_spacing: line[8], depth: line[9], description: line[10]}
end

puts plants


success_count = 0

plants.each do |plant|
  temp = Plant.create!(plant)
  if temp.id
    success_count += 1
    puts "Successfully added a plant (name: #{temp.name})"
  end
end

puts "#{success_count} out of #{plants.length} successfully added"

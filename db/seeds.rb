require 'csv'
require_relative '../app/models/zipcode'
require_relative '../app/models/zone'
require_relative '../app/models/plant'
require_relative '../app/models/schedule'
require_relative '../app/models/companion'


# seeding for zipcodes
zipcodes = []

["db/seeds/phm_ak_zipcode.csv", "db/seeds/phm_hi_zipcode.csv", "db/seeds/phm_pr_zipcode.csv", "db/seeds/phm_us_zipcode.csv"].each do |file|
  CSV.foreach(file, { :headers => true }) do |line|
    zipcodes << { zip: line[0], phzone: line[1], temp_range: line[2] }
  end
end

success_count = 0

zipcodes.each do |zipcode|
  temp = Zipcode.create!(zipcode)
  if temp.id
    success_count += 1
    puts "Successfully added. ZIP: #{temp.zip} Zone: #{temp.phzone}"
  end
end

puts "#{success_count} out of #{zipcodes.length} successfully added"

# seeding for zones
zones = []

CSV.foreach("db/seeds/zones_main.csv", { :headers => true }) do |line|
  zones << { main_zone: line[0], lowest_avg_temp_from: line[1].to_i, lowest_avg_temp_to: line[1].to_i + 10 }
end

success_count = 0

zones.each do |zone|
  temp = Zone.create!(zone)
  if temp.id
    success_count += 1
    puts "Successfully added. main_zone: #{temp.main_zone}, lowest_avg_temp_from: #{temp.lowest_avg_temp_from}, lowest_avg_temp_to: #{temp.lowest_avg_temp_to}, description: #{temp.description}"
  end
end

puts "#{success_count} out of #{zones.length} successfully added"


# seeding for plants
plants = []

CSV.foreach("db/seeds/plant_data.csv", { :headers => true }) do |line|
  plants << { plant_type: line[0].titleize, name: line[1].titleize, sun_exposure: line[2].titleize, soil_ph: line[3].titleize, soil_type: line[4].titleize, soil_drainage: line[5].titleize, water_requirement: line[6].titleize, row_spacing: line[7], plant_spacing: line[8], depth: line[9], description: line[10].capitalize}
end

success_count = 0

plants.each do |plant|
  temp = Plant.create!(plant)
  if temp.id
    success_count += 1
    puts "Successfully added a plant (name: #{temp.name})"
  end
end

puts "#{success_count} out of #{plants.length} successfully added"


# seeding for schedules
schedules = []
bads =[]

def get_zone_id(str)
  Zone.find_by(main_zone: str).id
end

def get_plant(str)
  Plant.find_by(name: str)
end


CSV.foreach("db/seeds/schedules.csv", { :headers => true }) do |line|
  temp_plant = get_plant(line[1].titleize)
  if temp_plant
    schedules << { zone_id: get_zone_id(line[0]), plant_id: temp_plant.id, start_seed_indoors: line[2], plant_outdoors: line[3], spring_planting: line[4], fall_planting: line[5] }
  else
    bads << { zone_id: get_zone_id(line[0]), plant_id: line[1], start_seed_indoors: line[2], plant_outdoors: line[3], spring_planting: line[4], fall_planting: line[5] }
  end
end

puts bads

success_count = 0

schedules.each do |schedule|
  temp = Schedule.create(schedule)
  if temp.id
    success_count += 1
    puts "Successfully added a schedule (zone: #{temp.zone_id}, plant: #{temp.plant_id})"
  else
    puts schedule
  end
end

puts "#{success_count} out of #{schedules.length} successfully added"

# seeding for companions
companions = []

def get_plant(str)
  Plant.find_by(name: str)
end

bads =[]

CSV.foreach("db/seeds/companion_data.csv", { :headers => true }) do |line|
  temp_plant = get_plant(line[0].titleize)
  one = line[1]
  two = line[2]

  if one
    one = line[1].titleize

  end

  if two
    two = line[2].titleize
  end

  if temp_plant
    companions << { plant_id: temp_plant.id, compatible: one, combative: two }
  else
    bads << { plant_id: line[0], compatible: line[1], combative: line[2] }
  end
end

success_count = 0

companions.each do |companion|
  temp = Companion.create(companion)
  if temp.id
    success_count += 1
    puts "Successfully added a companion (plant: #{temp.plant_id})"
  end
end

puts "#{success_count} out of #{companions.length} successfully added"

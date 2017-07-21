require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/app/models/*.rb'].each { |file| require file }

before do
  content_type 'application/json'
end

# Endpoints
get '/' do
  [{ message: 'Welcome to PLNTR API! Go to https://github.com/botrethewey/plntr-api' }].to_json
end

get '/zipcodes' do
  if params[:page]
    halt(404, [{ message:'Invalid Page Query'}].to_json) if (params[:page] !~ /^\d+$/ || params[:page].to_i < 1)
    zipcodes = Zipcode.all.order(:zip).offset(100 * (params[:page].to_i - 1)).first(100)
  elsif params[:zone]
    params[:zone] == "1" ? zipcodes = Zipcode.where(phzone: ["1a","1b"]).order(:zip) : zipcodes = Zipcode.where("phzone like ?", "#{params[:zone]}%").order(:zip)
  else
    zipcodes = Zipcode.all.order(:zip)
  end
  zipcodes.to_json
end

get '/zipcodes/:zip' do
  zipcode = Zipcode.where(zip: params[:zip]).first
  if zipcode
    [zipcode].to_json
  else
    halt(404, [{ message:'Plant Hardiness Zone Not Found'}].to_json)
  end
end

get '/zones/:main_zone' do
  zone = Zone.where(main_zone: params[:main_zone]).first
  if zone
    [zone].to_json
  else
    halt(404, [{ message: 'Zone Data Not Found'}].to_json)
  end
end

get '/plants' do
  plants = Plant.all.order(:name)

  if params[:name]
    temp_plants = Plant.where("name like ?", "#{params[:name].titleize}%")
    plants = plants & temp_plants
  end

  if params[:sun_exposure]
    temp_plants = Plant.where("sun_exposure like ?", "%#{params[:sun_exposure].titleize}%")
    plants = plants & temp_plants
  end

  if params[:soil_ph]
    temp_plants = Plant.where("soil_ph like ?", "%#{params[:soil_ph].titleize}%")
    plants = plants & temp_plants
  end

  if params[:soil_type]
    temp_plants = Plant.where("soil_type like ?", "%#{params[:soil_type].titleize}%")
    plants = plants & temp_plants
  end

  if params[:soil_drainage]
    temp_plants = Plant.where("soil_drainage like ?", "%#{params[:soil_drainage].titleize}%")
    plants = plants & temp_plants
  end

  if params[:water_requirement]
    temp_plants = Plant.where("water_requirement like ?", "%#{params[:water_requirement].titleize}%")
    plants = plants & temp_plants
  end

  if params[:zone]
    zone = Zone.find(params[:zone].to_i)
    if zone
      temp_plants = zone.plants.order(:name)
      plants = plants & temp_plants
    else
      halt(404, [{ message: 'Plant Data Not Found'}].to_json)
    end
  end

  plants.to_json
end

get '/plants/:id' do
  plant = Plant.find(params[:id])
  company = plant.companions
  zones = plant.zones
  if plant
    [plant, {companion_data: company}, {zone_data: zones}].to_json
  else
    halt(404, [{ message: 'Plant Data Not Found'}].to_json)
  end
end

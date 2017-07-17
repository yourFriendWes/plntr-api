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
  zipcodes = Zipcode.all
  if params[:page]
    halt(404, [{ message:'Invalid Page Query'}].to_json) if (params[:page] !~ /^\d+$/ || params[:page].to_i < 1)
    zipcodes = Zipcode.all.offset(100 * (params[:page].to_i - 1)).first(100)
  elsif params[:zone]
    params[:zone] == "1" ? zipcodes = Zipcode.where(phzone: ["1a","1b"]) : zipcodes = Zipcode.where("phzone like ?", "#{params[:zone]}%")
  end
  zipcodes.to_json
end

get '/zipcodes/:zip' do |zipcode|
  zipcode = Zipcode.where(zip: params[:zip]).first
  if zipcode
    [zipcode].to_json
  else
    halt(404, [{ message:'Plant Hardiness Zone Not Found'}].to_json)
  end
end

ENV['RACK_ENV'] = 'test'

require 'rspec'
require 'pg'
require 'pry'
require './lib/zipcode'
require './lib/zone'

# RSpec.configure do |config|
#   config.after(:each) do
#     DB.exec("DELETE FROM zipcodes *;")
#     DB.exec("DELETE FROM zones *;")
#   end
# end

# ENV['RACK_ENV'] = 'test'

require 'rspec'
require 'pg'
require 'sinatra/activerecord'
require 'pry'

require 'zipcode'
require 'zone'

RSpec.configure do |config|
  config.after(:each) do
    Zipcode.all.each do |zipcode|
      zipcode.destroy()
    end
    Zone.all.each do |zone|
      zone.destroy()
    end
    Plant.all.each do |plant|
      plant.destroy()
    end
  end
end

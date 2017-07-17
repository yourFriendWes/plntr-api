# ENV['RACK_ENV'] = 'test'

require 'rspec'
require 'pg'
require 'sinatra/activerecord'
require 'pry'

require 'zipcode'

RSpec.configure do |config|
  config.after(:each) do
    Zipcode.all.each do |zipcode|
      zipcode.destroy()
    end
  end
end

ENV['RACK_ENV'] = 'test'

require("bundler/setup")
Bundler.require(:default, :test)

set(:root, Dir.pwd())

Dir[File.dirname(__FILE__) + '/../app/models/*.rb'].each { |file| require file }

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
    Schedule.all.each do |schedule|
      schedule.destroy()
    end
    Companion.all.each do |companion|
      companion.destroy()
    end
  end
end

class Schedule < ActiveRecord::Base
  belongs_to :plant
  belongs_to :zone
end

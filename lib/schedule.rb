class Schedule < ActiveRecord::Base
  belong_to :plant
  belong_to :zone
end

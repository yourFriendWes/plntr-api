class Schedule < ActiveRecord::Base
  belongs_to :plant
  belongs_to :zone

  # validates :fall_planting, presence:true, if: :spring_option?
  # validates :plant_outdoors, presence:true, if: :single_season?
  #
  # def spring_option?
  #   spring_planting
  # end
  #
  # def single_season?
  #   fall_planting == nil && spring_planting == nil
  # end
end

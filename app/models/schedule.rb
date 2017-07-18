class Schedule < ActiveRecord::Base
  belongs_to :plant
  belongs_to :zone

  validates :fall_planting, presence:true, if: :spring_option?

  def spring_option?
    spring_planting != nil
  end
end

class Zone < ActiveRecord::Base
  has_many :schedules, dependent: :destroy

  validates :main_zone, presence: true, uniqueness: true, format: { with: /\A\d{1,2}\z/, message: "main_zone value range: 0 - 13" }
  validates :lowest_avg_temp_from, presence:true
end

class Plant < ActiveRecord::Base
  has_many :schedules, dependent: :destroy
  has_many :zones, through: :schedules
  has_many :companions, dependent: :destroy

  validates_inclusion_of :plant_type, :in => ["Vegetable", "Herb"], :allow_nil => false
  validates :name, presence: true, :uniqueness => {:case_sensitive => false}
  validates :sun_exposure, presence: true
  validates :soil_ph, presence: true
  validates :soil_type, presence: true
  validates :soil_drainage, presence: true
  validates :water_requirement, presence: true
  validates :row_spacing, presence: true, unless: :is_herb?
  validates :plant_spacing, presence: true, unless: :is_herb?
  validates :description, presence:true, if: :is_herb?

  def is_herb?
    plant_type == "Herb"
  end
end

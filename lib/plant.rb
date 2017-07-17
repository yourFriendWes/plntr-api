class Plant < ActiveRecord::Base
  has_many :plantitems
  has_many :zones, through: :plantitems

  validates_inclusion_of :type, :in => ["vegetable", "herb"], :allow_nil => false
  validates :name, presence: true, :uniqueness => {:case_sensitive => false}
  validates_inclusion_of :sun_exposure, :in => ["full sun", "partial sun", "partial shade", "full shade"], :allow_nil => false
  validates_inclusion_of :soil_ph, :in => ["acidic", "neutral", "alkaline"], :allow_nil => false
  validates_inclusion_of :soil_type, :in => ["sand", "silt", "clay", "peat", "loam"], :allow_nil => false
  validates_inclusion_of :soil_drainage, :in => ["well drained", "poorly drained", "average"], :allow_nil => false
  validates_inclusion_of :water_requirement, :in => ["ample", "average", "draught tolerant", "xeric/desert"], :allow_nil => false
  validates :depth, presence: true
  validates :row_spacing, presence: true
  validates :plant_spacing, presence: true
end

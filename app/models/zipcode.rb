class Zipcode < ActiveRecord::Base
  validates :zip, presence: true, uniqueness: true, format: { with: /\A\d{5}\z/, message: ":zip must be a 5 digit numbers" }

  validates_inclusion_of :phzone, :in => ["0a", "0b", "1a", "1b", "2a", "2b", "3a", "3b", "4a", "4b", "5a", "5b", "6a", "6b", "7a", "7b", "8a", "8b", "9a", "9b", "10a", "10b", "11a", "11b", "12a", "12b", "13a", "13b"], :allow_nil => false
end

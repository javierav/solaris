class DailySolarEnergy < ApplicationRecord
  self.table_name = "daily_solar_energy"

  validates :max, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :maxtime, presence: true
  validates :sum, presence: true, numericality: { greater_than_or_equal_to: 0 }
end

class DailySolarPower < ApplicationRecord
  self.table_name = "daily_solar_power"

  validates :max, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :maxtime, presence: true
end

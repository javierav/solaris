class DailyEnergyPriceExport < ApplicationRecord
  self.table_name = "daily_energy_price_export"

  validates :max, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :maxtime, presence: true
  validates :min, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :mintime, presence: true
  validates :avg, presence: true, numericality: { greater_than_or_equal_to: 0 }
end

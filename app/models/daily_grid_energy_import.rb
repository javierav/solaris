class DailyGridEnergyImport < ApplicationRecord
  self.table_name = "daily_grid_energy_import"

  validates :max, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :maxtime, presence: true
  validates :sum, presence: true, numericality: { greater_than_or_equal_to: 0 }
end

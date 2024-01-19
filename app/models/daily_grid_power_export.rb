class DailyGridPowerExport < ApplicationRecord
  self.table_name = "daily_grid_power_export"

  validates :max, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :maxtime, presence: true
end

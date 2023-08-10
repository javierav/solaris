class EnergyPrice < ApplicationRecord
  self.table_name = "energy_price"

  scope :by_date, ->(date) { where(datetime: date.all_day).order(datetime: :asc) }
end

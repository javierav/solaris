class Archive < ApplicationRecord
  self.table_name = "archive"

  scope :by_date, ->(date) { where(created_at: date.all_day).order(created_at: :asc) }
end

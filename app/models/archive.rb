class Archive < ApplicationRecord
  self.table_name = "archive"

  delegate :hour, to: :datetime

  scope :by_date, ->(date) { where(datetime: date.all_day).order(datetime: :asc) }
end

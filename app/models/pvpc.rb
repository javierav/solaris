class PVPC < ApplicationRecord
  self.table_name = "pvpc"

  validates :import, presence: true
  validates :export, presence: true

  scope :by_date, ->(date) { where(datetime: date.all_day).order(datetime: :asc) }

  before_validation :set_factor, on: :create

  private

  def set_factor
    return unless import.present? && export.present?

    self.factor = [(import / export).round(2), 99].min
  end
end

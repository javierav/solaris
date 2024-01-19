class EnergyPrice < ApplicationRecord
  validates :import, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :export, presence: true, numericality: { greater_than_or_equal_to: 0 }

  scope :by_date, ->(date) { where(datetime: date.all_day).order(datetime: :asc) }

  before_validation :set_factor, on: :create

  def self.import(date)
    raise NotImplementedError
  end

  def self.export(date)
    raise NotImplementedError
  end

  def self.read(date = Date.current)
    { import: import(date) || {}, export: export(date) || {} }
  end

  def self.store(date = Date.current)
    read(date).tap do |values|
      values[:import].each_pair do |datetime, value|
        find_or_create_by(datetime:) do |ep|
          ep.import = value
          ep.export = values[:export][datetime]
        end
      end
    end
  end

  private

  def set_factor
    return unless import.present? && export.present?

    self.factor = [(import / export).round(2), 99].min
  end
end

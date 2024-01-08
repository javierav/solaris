class EnergyPrice < ApplicationRecord
  self.store_full_sti_class = false

  belongs_to :zone

  scope :by_date, ->(date) { where(time: date.all_day).order(time: :asc) }

  validates :datetime, uniqueness: { scope: %i[type zone_id] }
  validates :import, presence: true, numericality: true
  validates :export, presence: true, numericality: true

  def self.load(date, zone)
    create!({ import: import(date, zone) || [], export: export(date, zone) || [] })
  end
end

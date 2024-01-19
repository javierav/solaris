class EnergyPeriod < ApplicationRecord
  has_and_belongs_to_many :zones, join_table: :zones_energy_periods

  enum :name, %i[p1 p2 p3].to_enum_hash

  validates :start_hour, presence: true
  validates :end_hour, presence: true
  validates :name, presence: true

  # TODO, this is not working with new format
  def self.kind_for(time, zone)
    where(zone: zone, day_type: time.day_type).where('start_hour <= ? AND end_hour >= ?', time.hour, time.hour).sole.name
  end
end

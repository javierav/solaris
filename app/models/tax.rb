class Tax < ApplicationRecord
  enum :kind, %i[value_add other].to_enum_hash, prefix: true
  enum :installation_type, %i[domestic other].to_enum_hash, prefix: true

  belongs_to :zone

  validates :installation_type, presence: true
  validates :start_at, presence: true
  validates :name, presence: true
  validates :percentage, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1 }

  def self.for_time_and_zone(time, zone)
    where(zone: zone).where('start_at <= ?', time).order(start_at: :desc).first # TODO, puede haber varios impuestos
  end
end

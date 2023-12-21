class Protocol < ApplicationRecord
  has_many :inverters, dependent: :restrict_with_error

  validates :name, presence: true, uniqueness: true
  validates :gateways, presence: true
  validates :solar_power, presence: true
  validates :solar_energy, presence: true
  validates :grid_power, presence: true
  validates :grid_energy_export, presence: true
  validates :grid_energy_import, presence: true
  validates :model, presence: true
  validates :serial_number, presence: true
  validates :firmware_version, presence: true
end

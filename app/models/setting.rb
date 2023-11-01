class Setting < ApplicationRecord
  thread_mattr_accessor :_instance, instance_accessor: false

  enum :energy_price, %i[esios].to_enum_hash
  enum :inverter, %i[huawei].to_enum_hash

  validates :timezone, presence: true
  validates :loop_interval, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :archive_interval, presence: true, numericality: { only_integer: true, greater_than: 0 }

  with_options presence: true, if: :esios? do
    validates :energy_price_at
    validates :esios_api_key
    validates :esios_zone
    validates :esios_country
  end

  with_options presence: true, if: :huawei? do
    validates :huawei_ip
    validates :huawei_port, numericality: { only_integer: true, greater_than: 0 }
  end

  def self.instance
    self._instance ||= lock.first_or_create!
  end
end

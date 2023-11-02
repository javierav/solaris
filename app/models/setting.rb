class Setting < ApplicationRecord
  thread_mattr_accessor :_instance, instance_accessor: false

  enum :energy_price, %i[esios].to_enum_hash
  enum :inverter, %i[huawei].to_enum_hash

  validates :timezone, presence: true
  validates :loop_interval, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :archive_interval, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :validate_archive_interval

  with_options presence: true, if: :energy_price? do
    validates :energy_price_at, format: { with: /\A\d{2}:\d{2}\z/ }
    validates :energy_price_for, inclusion: { in: %w[today tomorrow] }
  end

  with_options presence: true, if: :esios? do
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

  private

  def validate_archive_interval
    return unless archive_interval.present? && loop_interval.present? && loop_interval.positive?
    return if archive_interval % loop_interval == 0

    errors.add(:archive_interval, :multiple_of, count: loop_interval, value: archive_interval)
  end
end

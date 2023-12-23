class Setting < ApplicationRecord
  thread_mattr_accessor :_instance, instance_accessor: false

  enum :energy_price, %i[esios].to_enum_hash
  enum :inverter, %i[huawei].to_enum_hash
  enum :gateway, %i[modbus_mqtt].to_enum_hash

  validates :timezone, presence: true
  validates :loop_interval, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :archive_interval, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :gateway, presence: true, if: :inverter?

  with_options presence: true, if: :esios? do
    validates :energy_price_esios_api_key
    validates :energy_price_esios_zone
    validates :energy_price_esios_country
  end

  with_options presence: true, if: :modbus_mqtt? do
    validates :gateway_modbus_mqtt_ip
    validates :gateway_modbus_mqtt_port, numericality: { only_integer: true, greater_than: 0, less_than: 65_536 }
    validates :gateway_modbus_mqtt_slave_id, numericality: { only_integer: true, greater_than: 0, less_than: 256 }
    validates :gateway_modbus_mqtt_client_id
    validates :gateway_modbus_mqtt_account
    validates :gateway_modbus_mqtt_password
    validates :gateway_modbus_mqtt_subscribe_topic
    validates :gateway_modbus_mqtt_publish_topic
  end

  validate :validate_gateway

  def self.instance
    self._instance ||= lock.first_or_create!
  end

  def inverter_class
    "solaris/inverters/#{inverter}".classify.constantize
  end

  def gateway_class
    "solaris/gateways/#{gateway}".classify.constantize
  end

  private

  def validate_gateway
    return unless inverter.present? && gateway.present?

    errors.add(:gateway, :invalid) unless inverter_class.gateways.include?(gateway)
  end
end

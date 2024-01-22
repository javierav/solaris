require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
# require "active_storage/engine"
require "action_controller/railtie"
# require "action_mailer/railtie"
# require "action_mailbox/engine"
# require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Solaris
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # Application Timezone
    config.time_zone = ENV.fetch("TZ", "Europe/Madrid")

    # Application Region
    config.x.region = ENV.fetch("SOLARIS_REGION", "1").to_i

    # Intervals
    config.x.intervals.loop = ENV.fetch("SOLARIS_LOOP_INTERVAL", "30").to_i
    config.x.intervals.archive = ENV.fetch("SOLARIS_ARCHIVE_INTERVAL", "300").to_i

    # ESIOS
    config.x.esios.api_key = ENV.fetch("ESIOS_API_KEY", nil)

    # Protocol
    config.x.protocol = ENV.fetch("SOLARIS_PROTOCOL", nil)

    # Gateway
    config.x.gateway = ENV.fetch("SOLARIS_GATEWAY", nil)

    # Gateway Modbus MQTT
    config.x.gateways = Rails::Application::Configuration::Custom.new
    config.x.gateways.modbus_mqtt.host = ENV.fetch("SOLARIS_GATEWAY_MODBUS_MQTT_HOST", nil)
    config.x.gateways.modbus_mqtt.port = ENV.fetch("SOLARIS_GATEWAY_MODBUS_MQTT_PORT", nil)
    config.x.gateways.modbus_mqtt.ssl = ENV.fetch("SOLARIS_GATEWAY_MODBUS_MQTT_SSL", nil)
    config.x.gateways.modbus_mqtt.slave_id = ENV.fetch("SOLARIS_GATEWAY_MODBUS_MQTT_SLAVE_ID", nil)
    config.x.gateways.modbus_mqtt.client_id = ENV.fetch("SOLARIS_GATEWAY_MODBUS_MQTT_CLIENT_ID", nil)
    config.x.gateways.modbus_mqtt.account = ENV.fetch("SOLARIS_GATEWAY_MODBUS_MQTT_ACCOUNT", nil)
    config.x.gateways.modbus_mqtt.password = ENV.fetch("SOLARIS_GATEWAY_MODBUS_MQTT_PASSWORD", nil)
    config.x.gateways.modbus_mqtt.subscribe_topic = ENV.fetch("SOLARIS_GATEWAY_MODBUS_MQTT_SUBSCRIBE_TOPIC", nil)
    config.x.gateways.modbus_mqtt.publish_topic = ENV.fetch("SOLARIS_GATEWAY_MODBUS_MQTT_PUBLISH_TOPIC", nil)
  end
end

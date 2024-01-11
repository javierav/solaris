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

    # Intervals
    config.x.intervals.loop = ENV.fetch("SOLARIS_LOOP_INTERVAL", 30).to_i
    config.x.intervals.archive = ENV.fetch("SOLARIS_ARCHIVE_INTERVAL", 300).to_i

    # ESIOS
    config.x.esios.api_key = ENV.fetch("ESIOS_API_KEY", nil)
    config.x.esios.zone = ENV.fetch("ESIOS_ZONE", 8741)
  end
end

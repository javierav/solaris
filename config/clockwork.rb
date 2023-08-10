require_relative "environment"

module Clockwork
  configure do |config|
    config[:tz] = ENV.fetch("SOLARIS_TIMEZONE", "Europe/Madrid").to_s
  end

  every(ENV.fetch("SOLARIS_LOOP_INTERVAL", 30).to_i.seconds, "solaris.loop", thread: true) do
    Solaris::Loop.run
  end

  every(1.day, "solaris.energy_price", at: ENV.fetch("SOLARIS_ENERGY_PRICE_AT", "21:00").to_s, thread: true) do
    price_for = ENV.fetch("SOLARIS_ENERGY_PRICE_FOR", "tomorrow").to_s
    Solaris::EnergyPrice.store(price_for == "tomorrow" ? Date.tomorrow : Date.current)
  end

  every(1.day, "solaris.archive.daily", at: "00:01", thread: true) do
    Solaris::DailyArchive.run
  end
end

require_relative "environment"

module Clockwork
  configure do |config|
    config[:tz] = ENV.fetch("SOLARIS_TIMEZONE", "Europe/Madrid").to_s
  end

  every(Config.loop_interval.seconds, "solaris.loop", thread: true) do
    Solaris::Loop.run
  end

  every(1.day, "solaris.esios", at: ["20:30", "21:30", "22:30", "23:30"], thread: true) do
    Solaris::ESIOS.run
  end
end

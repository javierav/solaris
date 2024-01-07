require_relative "environment"

scheduler = Rufus::Scheduler.new
loop_interval = ENV.fetch("SOLARIS_LOOP_INTERVAL", 30).to_i

scheduler.every loop_interval, name: "solaris.loop", first_at: Time.current.beginning_of_minute + 1.minute do
  Solaris::Loop.run
end

scheduler.cron "0 21 * * * Europe/Madrid", name: "solaris.energy_prices.esios_pvpc" do
  Solaris::EnergyPrice.store(Date.tomorrow)
end

scheduler.cron "1 0 * * * #{tz}", name: "solaris.archive.daily" do
  Solaris::DailyArchive.run
end

scheduler.join

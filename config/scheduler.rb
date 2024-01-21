scheduler = Rufus::Scheduler.new
loop_interval = Rails.configuration.x.intervals.loop

scheduler.every loop_interval, name: "solaris.loop" do
  Loop.run
end

if Rails.configuration.x.esios.api_key.present?
  scheduler.cron "0 21 * * * Europe/Madrid", name: "solaris.energy_prices.pvpc" do
    EnergyPrices::PVPC.store(Date.current.tomorrow)
  end
end

scheduler.cron "1 0 * * * #{Rails.application.config.time_zone}", name: "solaris.daily" do
  Daily.run
end

scheduler.join

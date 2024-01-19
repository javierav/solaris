scheduler = Rufus::Scheduler.new
loop_interval = Rails.configuration.x.intervals.loop

scheduler.every loop_interval, name: "solaris.loop" do
  Loop.run
end

if Rails.configuration.x.esios.api_key.present?
  scheduler.cron "0 21 * * * Europe/Madrid", name: "solaris.energy_price" do
    StorePVPC.run(Date.tomorrow)
  end
end

scheduler.cron "1 0 * * * #{Rails.application.config.time_zone}", name: "solaris.archive.daily" do
  Solaris::DailyArchive.run
end

scheduler.join

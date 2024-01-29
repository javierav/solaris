scheduler = Rufus::Scheduler.new
loop_interval = Rails.configuration.x.intervals.loop
archive_interval = Rails.configuration.x.intervals.archive
store = MetricStore.new

scheduler.every loop_interval, name: "solaris.loop.main" do
  Loops::Main.run(store)
end

scheduler.every archive_interval, name: "solaris.loop.archive" do
  Loops::Archive.run(store)
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

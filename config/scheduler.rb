scheduler = Rufus::Scheduler.new
loop_interval = Rails.application.config.x.intervals.loop

scheduler.every loop_interval, name: "solaris.loop", first_at: Time.current.beginning_of_minute + 1.minute do
  Solaris::Loop.run
end

scheduler.cron "0 21 * * * Europe/Madrid", name: "solaris.energy_price" do
  StorePVPC.run(Date.tomorrow)
end

scheduler.cron "1 0 * * * #{Rails.application.config.time_zone}", name: "solaris.archive.daily" do
  Solaris::DailyArchive.run
end

scheduler.join

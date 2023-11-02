require_relative "environment"

scheduler = Rufus::Scheduler.new
# loop_interval = ENV.fetch("SOLARIS_LOOP_INTERVAL", 30).to_i.seconds.to_i
# price_at = ENV.fetch("SOLARIS_ENERGY_PRICE_AT", "21:00").to_s.split(":").reverse.join(" ")
# tz = ENV.fetch("SOLARIS_TIMEZONE", "Europe/Madrid").to_s
#
# scheduler.every loop_interval, name: "solaris.loop", first_at: Time.current.beginning_of_minute + 1.minute do
#   # Solaris::Loop.run
# end
#
# scheduler.cron "#{price_at} * * * #{tz}", name: "solaris.energy_price" do
#   price_for = ENV.fetch("SOLARIS_ENERGY_PRICE_FOR", "tomorrow").to_s
#   Solaris::EnergyPrice.store(price_for == "tomorrow" ? Date.tomorrow : Date.current)
# end
#
# scheduler.cron "1 0 * * * #{tz}", name: "solaris.archive.daily" do
#   # Solaris::DailyArchive.run
# end

scheduler.every Setting.instance.loop_interval do |job|
  puts "current: #{Time.current} - scheduled_at: #{job.scheduled_at} - next_time: #{job.next_time} - loop_interval: #{Setting.instance.loop_interval}"

  job.next_time = ::EtOrbi::EoTime.now + Setting.instance.reload.loop_interval
end

scheduler.join

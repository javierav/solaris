namespace :solaris do
  namespace :energy_price do
    desc "Retrieve energy price for date"
    task :store, [:date] => :environment do |_t, args|
      Solaris::EnergyPrice.store(args[:date] ? Date.parse(args[:date]) : Date.current)
    end
  end

  namespace :archive do
    desc "Run daily archive"
    task :daily, [:date] => :environment do |_t, args|
      Solaris::DailyArchive.run(args[:date] ? Date.parse(args[:date]) : Date.current)
    end
  end
end

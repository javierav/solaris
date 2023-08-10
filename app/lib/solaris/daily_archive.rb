module Solaris
  class DailyArchive
    def self.run(date = Date.yesterday)
      new(date).run
    end

    def initialize(date)
      @date = date
    end

    def run
      classes.each do |klass|
        klass.new(@date, Archive.by_date(@date)).run
      end
    end

    private

    def classes
      [
        Solaris::DailyArchives::SolarEnergy,
        Solaris::DailyArchives::SolarPower,
        Solaris::DailyArchives::GridPowerImport,
        Solaris::DailyArchives::GridPowerExport,
        Solaris::DailyArchives::GridEnergyImport,
        Solaris::DailyArchives::GridEnergyExport,
        Solaris::DailyArchives::EnergyPriceImport,
        Solaris::DailyArchives::EnergyPriceExport
      ]
    end
  end
end

module EnergyPrices
  class PVPC < EnergyPrice
    def self.import(date, zone)
      ::ESIOS::Import.for_date(date, zone)
    end

    def self.export(date, zone)
      ::ESIOS::Export.for_date(date, zone)
    end
  end
end

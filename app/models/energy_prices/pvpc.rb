module EnergyPrices
  class PVPC < EnergyPrice
    def self.import(date)
      ESIOS::Import.for_date(date)
    end

    def self.export(date)
      ESIOS::Export.for_date(date)
    end
  end
end

module Solaris
  class EnergyPrice
    def self.read(date = Date.current)
      new(date).read
    end

    def self.store(date = Date.current)
      new(date).store
    end

    def initialize(date)
      @date = date
    end

    def read
      @read ||= candidate&.new(@date)&.read || nil
    end

    def store
      store_import_prices
      store_export_prices
    end

    private

    def candidate
      "Solaris::EnergyPrices::#{candidate_class}".safe_constantize
    end

    def candidate_class
      Setting.instance.energy_price&.camelize
    end

    def store_import_prices
      read[:import].each do |data|
        energy_price = ::EnergyPrice.find_or_initialize_by(datetime: data[:datetime])
        energy_price.assign_attributes(import: data[:value])
        energy_price.save
      end
    end

    def store_export_prices
      read[:export].each do |data|
        energy_price = ::EnergyPrice.find_or_initialize_by(datetime: data[:datetime])
        energy_price.assign_attributes(export: data[:value])
        energy_price.save
      end
    end
  end
end

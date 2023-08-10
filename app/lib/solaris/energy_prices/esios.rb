module Solaris
  module EnergyPrices
    class ESIOS < Base
      def self.available?
        ENV.fetch("ESIOS_API_KEY").present?
      end

      def import
        ::ESIOS::Import.for_date(@date)
      end

      def export
        ::ESIOS::Export.for_date(@date)
      end
    end
  end
end

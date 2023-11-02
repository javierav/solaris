module Solaris
  module EnergyPrices
    class ESIOS < Base
      def import
        ::ESIOS::Import.for_date(@date)
      end

      def export
        ::ESIOS::Export.for_date(@date)
      end
    end
  end
end

module Solaris
  module EnergyPrices
    class Base
      def self.available?
        raise NotImplementedError
      end

      def initialize(date)
        @date = date
      end

      def read
        { import: import || [], export: export || [] }
      end

      def import
        raise NotImplementedError
      end

      def export
        raise NotImplementedError
      end
    end
  end
end

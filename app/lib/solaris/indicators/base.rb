module Solaris
  module Indicators
    class Base
      include Solaris::Identificable

      attr_reader :period

      def initialize(period)
        @period = period
      end

      def value
        raise NotImplementedError
      end
    end
  end
end

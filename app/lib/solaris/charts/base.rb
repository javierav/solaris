module Solaris
  module Charts
    class Base
      attr_reader :period

      def initialize(period = Period.new(:now))
        @period = period
      end

      def run
        [data, options]
      end

      private

      def chart_type
        raise NotImplementedError
      end

      def chart_label
        self.class.name.demodulize.underscore
      end

      def data
        {
          datasets: [
            {
              type: chart_type,
              label: chart_label,
              data: collection
            }
          ]
        }
      end

      def options
        {
          scales: {
            y: {
              beginAtZero: true,
              grace: "5%"
            }
          }
        }
      end

      def collection
        send(period.collection_method)
      end
    end
  end
end

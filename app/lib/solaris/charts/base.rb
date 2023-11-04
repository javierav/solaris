module Solaris
  module Charts
    class Base
      include Solaris::Identificable

      attr_reader :period

      def initialize(period)
        @period = period
      end

      def data
        {
          datasets: [
            {
              type: chart_type,
              label: chart_label,
              data: collection,
              borderColor: "rgb(255, 205, 86)",
              backgroundColor: "rgba(255, 205, 86, 0.5)",
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
          },
          responsive: true,
          elements: {
            bar: {
              borderWidth: 2
            }
          },
          plugins: {
            legend: false
          }
        }
      end

      private

      def chart_type
        raise NotImplementedError
      end

      def chart_label
        self.class.name.demodulize.underscore
      end

      def collection
        send("collection_for_#{period.type}")
      end
    end
  end
end

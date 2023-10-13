module Solaris
  module Charts
    class SolarPower < Base
      def chart_type
        "line"
      end

      def archive_collection
        Archive.where(created_at: period.range).select(:created_at, :solar_power)
      end

      def collection_for_now_day
        archive_collection.map { |archive| { x: archive.created_at, y: archive.solar_power } }
      end

      def options
        {
          scales: {
            x: {
              type: 'time',
              time: {
                tooltipFormat: 'DD T'
              },
              title: {
                display: true,
                text: 'Date'
              }
            },
            y: {
              title: {
                display: true,
                text: 'value'
              }
            }
          }
        }
      end
    end
  end
end

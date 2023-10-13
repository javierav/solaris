module Solaris
  module Charts
    class SolarEnergy < Base
      def chart_type
        "bar"
      end

      def archive_collection
        Archive.where(created_at: period.range).select(:created_at, :solar_energy)
      end

      def archive_daily_collection
        ArchiveDailySolarEnergy.where(date: period.range).select(:date, :sum)
      end

      def collection_for_now_day
        archive_collection.group_by { |archive| archive.created_at.hour }.transform_values do |archives|
          (archives.last.solar_energy - archives.first.solar_energy).round(2)
        end.map { |hour, sum| { x: "#{hour.to_s.rjust(2, "0")}:00", y: sum } }
      end

      def collection_for_week
        archive_daily_collection.map do |archive|
          { x: I18n.t("date.abbr_day_names")[archive.date.wday].camelize, y: archive.sum }
        end
      end

      def collection_for_month
        archive_daily_collection.map do |archive|
          { x: archive.date.day.to_s, y: archive.sum }
        end
      end

      def collection_for_year
        archive_daily_collection.group_by { |archive| archive.date.month }.map do |month, archives|
          { x: I18n.t("date.abbr_month_names")[month].camelize, y: archives.sum(&:sum) }
        end
      end

      def collection_for_all
        archive_daily_collection.group_by { |archive| archive.date.year }.map do |year, archives|
          { x: year.to_s, y: archives.sum(&:sum) }
        end
      end
    end
  end
end

module Solaris
  module DailyArchives
    class GridPowerExport < Base
      def max
        _max.round(2)
      end

      def maxtime
        archives.where(grid_power: _max).first&.created_at
      end

      def _max
        archives.where("grid_power >= 0").maximum(:grid_power) || 0.0
      end
    end
  end
end

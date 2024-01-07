module Solaris
  module DailyArchives
    class GridPowerImport < Base
      def max
        _max.abs.round(2)
      end

      def maxtime
        archives.where(grid_power: _max).first&.created_at
      end

      def _max
        archives.where("grid_power <= 0").minimum(:grid_power) || 0.0
      end
    end
  end
end

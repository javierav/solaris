module Dailies
  class GridPowerExport < Daily
    self.table_name = "daily_grid_power_export"

    validates :max, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :maxtime, presence: true

    def compute_max
      Archive.by_date(date).where("grid_power >= 0").maximum(:grid_power).try(:round, 2) || 0
    end

    def compute_maxtime
      Archive.by_date(date).where("grid_power >= 0").max_by(&:grid_power).try(:datetime)
    end
  end
end

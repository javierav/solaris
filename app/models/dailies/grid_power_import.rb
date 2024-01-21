module Dailies
  class GridPowerImport < Daily
    self.table_name = "daily_grid_power_import"

    validates :max, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :maxtime, presence: true
    validates :min, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :mintime, presence: true

    def compute_max
      Archive.by_date(date).where("grid_power <= 0").minimum(:grid_power).try(:abs).try(:round, 2) || 0
    end

    def compute_maxtime
      Archive.by_date(date).where("grid_power <= 0").min_by(&:grid_power).try(:datetime)
    end

    def compute_min
      Archive.by_date(date).where("grid_power <= 0").maximum(:grid_power).try(:abs).try(:round, 2) || 0
    end

    def compute_mintime
      Archive.by_date(date).where("grid_power <= 0").max_by(&:grid_power).try(:datetime)
    end
  end
end

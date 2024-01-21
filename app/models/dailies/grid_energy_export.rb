module Dailies
  class GridEnergyExport < Daily
    self.table_name = "daily_grid_energy_export"

    validates :max, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :maxhour, presence: true, numericality: {
      only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 23
    }
    validates :sum, presence: true, numericality: { greater_than_or_equal_to: 0 }

    def compute_max
      sum_by_hour.values.max.round(2)
    end

    def compute_maxhour
      sum_by_hour.max_by(&:last).first
    end

    def compute_min
      sum_by_hour.values.min.round(2)
    end

    def compute_minhour
      sum_by_hour.min_by(&:last).first
    end

    def compute_sum
      Archive.by_date(date).maximum(:grid_energy_export) - Archive.by_date(date).minimum(:grid_energy_export)
    end

    private

    def group_by_hour
      @group_by_hour ||= Archive.by_date(date).group_by(&:hour)
    end

    def sum_by_hour
      @sum_by_hour ||= group_by_hour.transform_values do |archives|
        archives.map(&:grid_energy_export).max - archives.map(&:grid_energy_export).min
      end
    end
  end
end

module Dailies
  class EnergyPriceExport < Daily
    self.table_name = "daily_energy_price_export"

    validates :max, presence: true, numericality: true
    validates :maxhour, presence: true, numericality: {
      only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 23
    }
    validates :min, presence: true, numericality: true
    validates :minhour, presence: true, numericality: {
      only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 23
    }
    validates :avg, presence: true, numericality: true

    def compute_max
      EnergyPrice.by_date(date).maximum(:export)
    end

    def compute_maxhour
      EnergyPrice.by_date(date).max_by(&:export).try(:datetime).try(:hour)
    end

    def compute_min
      EnergyPrice.by_date(date).minimum(:export)
    end

    def compute_minhour
      EnergyPrice.by_date(date).min_by(&:export).try(:datetime).try(:hour)
    end

    def compute_avg
      EnergyPrice.by_date(date).average(:export).try(:round, 4)
    end
  end
end

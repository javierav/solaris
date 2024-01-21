module Dailies
  class SolarPower < Daily
    self.table_name = "daily_solar_power"

    validates :max, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :maxtime, presence: true

    def compute_max
      Archive.by_date(date).maximum(:solar_power)
    end

    def compute_maxtime
      Archive.by_date(date).max_by(&:solar_power).try(:datetime)
    end
  end
end

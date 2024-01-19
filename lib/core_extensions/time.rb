module CoreExtensions
  module Time
    def holiday?
      Holiday.where(date: self.to_date).any?
    end

    def day_type
      saturday? || sunday? || holiday? ? :weekend_holiday : :working_day
    end
  end
end

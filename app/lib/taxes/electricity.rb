module Taxes
  class Electricity
    def self.for(time_or_date)
      new(time_or_date).for
    end

    def initialize(time_or_date)
      @date = time_or_date.respond_to?(:to_date) ? time_or_date.to_date : time_or_date
    end

    def for
      case @date
      when Date.new(2023, 1, 1)..Date.new(2023, 12, 31)
        0.005
      when Date.new(2024, 1, 1)..Date.new(2024, 3, 31)
        0.025
      when Date.new(2024, 4, 1)..Date.new(2024, 6, 30)
        0.038
      else
        0.0
      end
    end
  end
end

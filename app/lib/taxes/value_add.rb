module Taxes
  class ValueAdd
    def self.for(time_or_date)
      new(time_or_date).for
    end

    def initialize(time_or_date)
      @date = time_or_date.respond_to?(:to_date) ? time_or_date.to_date : time_or_date
    end

    def for
      case Region.current.key.to_sym
      when :pen, :bal
        for_pb
      when :can
        for_can
      when :ceu, :mel
        for_cm
      end
    end

    private

    def for_pb
      case @date
      when Date.new(2023, 1, 1)..Date.new(2023, 12, 31)
        0.05
      else
        0.1
      end
    end

    def for_can
      0.0
    end

    def for_cm
      0.01
    end
  end
end

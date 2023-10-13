class Period
  attr_reader :value

  def initialize(value)
    @value = value.to_s
  end

  def period
    @period ||= case value
    when /\d{4}-\d{2}-\d{2}/
      :day
    when /\d{4}-W\d{2}/
      :week
    when /\d{4}-\d{2}/
      :month
    when /\d{4}/
      :year
    when "all", "now"
      value.to_sym
    end
  end

  def date
    case period
    when :now
      Date.current
    when :day, :week
      Date.parse(value)
    when :month
      Date.parse("#{value}-01")
    when :year
      Date.parse("#{value}-01-01")
    end
  end

  def period_start
    case period
    when :now, :day
      date.beginning_of_day
    when :week
      date.beginning_of_week.beginning_of_day
    when :month
      date.beginning_of_month.beginning_of_day
    when :year
      date.beginning_of_year.beginning_of_day
    when :all
      nil
    end
  end

  def period_end
    case period
    when :now, :day
      date.end_of_day
    when :week
      date.end_of_week.end_of_day
    when :month
      date.end_of_month.end_of_day
    when :year
      date.end_of_year.end_of_day
    when :all
      Date.current.end_of_day
    end
  end

  def collection_method
    case period
    when :now, :day
      :collection_for_now_day
    when :week
      :collection_for_week
    when :month
      :collection_for_month
    when :year
      :collection_for_year
    when :all
      :collection_for_all
    end
  end

  def range
    period_start..period_end
  end

  def to_param
    @value
  end

  def daily?
    %i[now day].include?(period)
  end

  def weekly?
    period == :week
  end

  def monthly?
    period == :month
  end

  def yearly?
    period == :year
  end

  def all?
    period == :all
  end
end

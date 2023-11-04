class Period < Range
  FORMATS = {
    day: "%Y-%m-%d",
    week: "%G-W%V",
    month: "%Y-%m",
    year: "%Y"
  }.freeze

  attr_reader :type

  def self.parse(value)
    type = parse_type(value)
    start_at, end_at = timeframe(type, value)
    new(type, start_at, end_at)
  end

  def self.parse_type(value)
    case value.to_s
    when /\d{4}-\d{2}-\d{2}\:\d{4}-\d{2}-\d{2}/
      :custom
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

  def self.timeframe(type, value)
    case type
    when :now
      [Date.current.beginning_of_day, Date.current.end_of_day]
    when :day
      [Date.parse(value).beginning_of_day, Date.parse(value).end_of_day]
    when :week
      [Date.parse(value).beginning_of_week.beginning_of_day, Date.parse(value).end_of_week.end_of_day]
    when :month
      [Date.parse("#{value}-01").beginning_of_month.beginning_of_day, Date.parse("#{value}-01").end_of_month.end_of_day]
    when :year
      [Date.parse("#{value}-01-01").beginning_of_year.beginning_of_day, Date.parse("#{value}-01-01").end_of_year.end_of_day]
    when :all
      [Archive.minimum(:created_at), Date.current.end_of_day]
    when :custom
      [Date.parse(value.split(":").first).beginning_of_day, Date.parse(value.split(":").last).end_of_day]
    end
  end

  def initialize(type, start_at, end_at)
    @type = type
    super(start_at, end_at)
  end

  def now?
    type == :now
  end

  def day?
    type == :day
  end

  def week?
    type == :week
  end

  def month?
    type == :month
  end

  def year?
    type == :year
  end

  def all?
    type == :all
  end

  def custom?
    type == :custom
  end

  def current_day
    min_ending.strftime(format(:day))
  end

  def current_week
    min_ending.strftime(format(:week))
  end

  def current_month
    min_ending.strftime(format(:month))
  end

  def current_year
    min_ending.strftime(format(:year))
  end

  def current_custom
    [min_ending.strftime(format(:day)), min_ending.strftime(format(:day))].join(":")
  end

  def prev
    change_date(-1)
  end

  def next
    change_date(1)
  end

  def to_param
    case type
    when :now, :all
      type.to_s
    when :day
      first.strftime(format(:day))
    when :week
      first.strftime(format(:week))
    when :month
      first.strftime(format(:month))
    when :year
      first.strftime(format(:year))
    when :custom
      [first, last].map { |date| date.strftime(format(:day)) }.join(":")
    end
  end

  private

  def format(target = type)
    FORMATS[target]
  end

  def change_date(amount)
    return if type.in?(%i[now all custom])

    self.class.new(type, first + amount.send(type), last + amount.send(type))
  end

  def min_ending
    [last, Date.current.end_of_day].min
  end
end

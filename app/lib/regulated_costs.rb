class RegulatedCosts
  COSTS = %i[transport distribution charges].freeze

  def self.for(time_or_date)
    new(time_or_date).for
  end

  def initialize(time_or_date)
    @time_or_date = time_or_date
  end

  def for
    if @time_or_date.is_a?(Date)
      for_date
    elsif @time_or_date.is_a?(Time)
      for_time
    end
  end

  private

  def for_date
    costs[@time_or_date.year.to_s]
  end

  def for_time
    for_date[EnergyPeriod.for(@time_or_date)]
  end

  def prices
    # [year, [[peak_transport, peak_distribution, peak_charges], [standard...], [off_peak...]]]
    [
      ["2023", [[0.004506, 0.024592, 0.043893], [0.003050, 0.016744, 0.008779], [0.000128, 0.000852, 0.002195]]],
      ["2024", [[0.004528, 0.028553, 0.043893], [0.002589, 0.016595, 0.008779], [0.000075, 0.000482, 0.002195]]]
    ]
  end

  def costs
    prices.to_h do |year, periods|
      [
        year,
        EnergyPeriod::PERIODS.each_with_index.to_h do |period, period_index|
          [period, COSTS.each_with_index.to_h { |type, type_index| [type, periods[period_index][type_index]] }]
        end
      ]
    end
  end
end

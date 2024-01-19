class DailyEnergyPriceImportAggregation < ApplicationAggregation
  def max
    EnergyPrice.by_date(date).maximum(:import)
  end

  def maxtime
    EnergyPrice.by_date(date).where(import: max).first.try(:datetime)
  end

  def min
    EnergyPrice.by_date(date).minimum(:import)
  end

  def mintime
    EnergyPrice.by_date(date).where(import: min).first.try(:datetime)
  end

  def avg
    EnergyPrice.by_date(date).average(:import).try(:round, 4)
  end
end

class DailyGridEnergyExportAggregation < Base
  def max
    sum_by_hour.values.max.round(2)
  end

  def maxtime
    date.to_time.change(hour: sum_by_hour.max_by { |a| a[1] }.first)
  end

  def sum
    (archives_array.last.grid_energy_export - archives_array.first.grid_energy_export).round(2)
  end

  private

  def archives_array
    @archives_array ||= archives.to_a
  end

  def group_by_hour
    @group_by_hour ||= archives_array.group_by do |archive|
      archive.created_at.hour
    end
  end

  def sum_by_hour
    @sum_by_hour ||= group_by_hour.transform_values do |archives|
      archives.last.grid_energy_export - archives.first.grid_energy_export
    end
  end
end

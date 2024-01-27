class EnergyPeriod
  def self.for(time)
    new(time).for
  end

  def initialize(time)
    @time = time
  end

  def for
    case Region.current.key.to_sym
    when :pen, :can, :bal
      for_pcb
    when :ceu, :mel
      for_cm
    end
  end

  private

  def for_pcb
    holiday? || weekend? ? :off_peak : for_pcb_weekday
  end

  def for_pcb_weekday
    case @time.hour
    when 0..7
      :off_peak
    when 8..9, 14..17, 22..23
      :standard
    else
      :peak
    end
  end

  def for_cm
    holiday? || weekend? ? :off_peak : for_cm_weekday
  end

  def for_cm_weekday
    case @time.hour
    when 0..7
      :off_peak
    when 8..10, 15..18, 23
      :standard
    else
      :peak
    end
  end

  def weekend?
    @time.saturday? || @time.sunday?
  end

  def holiday?
    Holiday.include?(@time)
  end
end

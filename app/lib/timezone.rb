class Timezone
  def self.current(hour)
    TZInfo::Timezone
      .all_identifiers
      .select { |zone|
        Time.current.in_time_zone(zone).hour == hour
      }
  end
end

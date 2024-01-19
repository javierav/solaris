class Loop
  def self.run
    new.run
  end

  def run
    perform_archive if condition_for_archive
  end

  private

  def archive_interval
    Rails.configuration.x.intervals.archive
  end

  def last_archive
    @last_archive ||= Archive.order(datetime: :desc).first
  end

  def condition_for_archive
    last_archive.nil? || last_archive.datetime < archive_interval.seconds.ago
  end

  def perform_archive
    Archive.create!(read_inverter_data.merge(datetime: Time.current)).persisted?
  end

  def read_inverter_data
    Inverter.read
  end
end

module Solaris
  class Loop
    def self.run
      new.run
    end

    def run
      perform_archive if condition_for_archive
    end

    private

    def archive_interval
      ENV.fetch("SOLARIS_ARCHIVE_INTERVAL", 60).to_i
    end

    def last_archive
      @last_archive ||= Archive.order(created_at: :desc).first
    end

    def condition_for_archive
      last_archive.nil? || last_archive.created_at < archive_interval.seconds.ago
    end

    def perform_archive
      Archive.create(read_inverter_data).persisted?
    end

    def read_inverter_data
      loop do
        data = Solaris::Inverter.read
        break data if data.present?
      end
    end
  end
end

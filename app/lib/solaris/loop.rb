module Solaris
  class Loop
    def self.run
      new.run
    end

    def run
      perform_archive if condition_for_archive
    end

    private

    def last_archive
      Archive.order(created_at: :desc).first
    end

    def condition_for_archive
      last_archive.nil? || last_archive.created_at < Config.archive_interval.seconds.ago
    end

    def perform_archive
      loop do
        break if Archive.create_from_inverter.persisted?
      rescue Errno::ECONNRESET
        Rails.logger.error "Connection reset, retrying..."
      end
    end
  end
end

module Solaris
  class ESIOS
    def self.run
      new.run
    end

    def run
      perform_pvpc if condition_for_pvpc
    end

    private

    def perform_pvpc
      pvpc_import
      pvpc_export
    end

    def condition_for_pvpc
      PVPC.where(datetime: tomorrow_range).count != 24
    end

    def tomorrow
      Date.tomorrow
    end

    def tomorrow_range
      tomorrow.all_day
    end

    def pvpc_import
      ESIOS::Import.for_date(tomorrow).each do |data|
        pvpc = PVPC.find_or_initialize_by(datetime: data[:datetime])
        pvpc.assign_attributes(import: data[:value])
        pvpc.save
      end
    end

    def pvpc_export
      ESIOS::Export.for_date(tomorrow).each do |data|
        pvpc = PVPC.find_or_initialize_by(datetime: data[:datetime])
        pvpc.assign_attributes(export: data[:value])
        pvpc.save
      end
    end
  end
end

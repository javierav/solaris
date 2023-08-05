namespace :solaris do
  desc "Populate database with PVPC data"
  task populate_pvpc: :environment do
    ESIOS::Import.for_today.each do |data|
      pvpc = PVPC.find_or_initialize_by(datetime: data[:datetime])
      pvpc.assign_attributes(import: data[:value])
      pvpc.save
    end

    ESIOS::Export.for_today.each do |data|
      pvpc = PVPC.find_or_initialize_by(datetime: data[:datetime])
      pvpc.assign_attributes(export: data[:value])
      pvpc.save
    end
  end
end

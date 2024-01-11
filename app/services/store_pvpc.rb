class StorePVPC
  def self.run(date = Date.current)
    new(date).run
  end

  def initialize(date)
    @date = date
  end

  def run
    read[:import].each_pair do |datetime, value|
      PVPC.find_or_create_by(datetime:) do |pvpc|
        pvpc.import = value
        pvpc.export = read[:export][datetime]
      end
    end

    read
  end

  private

  def read
    @read ||= { import: import || {}, export: export || {} }
  end

  def import
    ESIOS::Import.for_date(@date)
  end

  def export
    ESIOS::Export.for_date(@date)
  end
end

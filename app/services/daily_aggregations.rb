class DailyAggregations
  def self.run(date = Date.yesterday)
    new(date).run
  end

  def initialize(date)
    @date = date
  end

  def run
    classes.each do |klass|
      klass.new(@date).run
    end
  end

  private

  def classes
    [
      DailyPVPCImportAggregation
    ]
  end
end

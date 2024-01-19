class ApplicationAggregation
  attr_reader :date

  def initialize(date)
    @date = date
  end

  def run
    instance = model.find_or_initialize_by(date: @date)
    instance.assign_attributes(aggregations)
    instance.save
  end

  private

  def aggregations_columns
    %i[max maxtime min mintime sum avg]
  end

  def aggregations
    aggregations_columns.each_with_object({}) do |column, hash|
      hash[column] = send(column) if respond_to?(column)
    end
  end

  def model
    self.class.name.delete_suffix("Aggregation").demodulize.constantize
  end
end

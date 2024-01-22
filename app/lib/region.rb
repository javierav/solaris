class Region
  attr_reader :id

  def self.current
    new(Rails.configuration.x.region)
  end

  def initialize(id)
    @id = id.to_i
  end

  def name
    I18n.t(key, scope: "regions")
  end

  def key
    %w[pen can bal ceu mel][id - 1]
  end

  def esios
    [8741, 8742, 8743, 8744, 8745][id - 1]
  end
end

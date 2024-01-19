class Gateway
  def self.current
    "#{Rails.configuration.x.gateway.classify}Gateway".constantize
  end
end

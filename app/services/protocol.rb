class Protocol
  def self.current
    "#{Rails.configuration.x.protocol.classify}Protocol".constantize
  end
end

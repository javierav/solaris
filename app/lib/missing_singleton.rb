module MissingSingleton
  def self.included(base)
    base.extend ClassMethods
    class << base
      delegate_missing_to :instance
    end
  end

  module ClassMethods
    def instance
      @instance ||= new
    end
  end
end

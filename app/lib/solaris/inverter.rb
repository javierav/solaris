module Solaris
  class Inverter
    def self.read
      Setting.instance.inverter_class&.read || nil
    end
  end
end

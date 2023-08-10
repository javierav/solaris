module Solaris
  class Inverter
    def self.read
      new.read
    end

    def read
      candidate&.read || nil
    end

    private

    def candidate
      classes.find(&:available?)
    end

    def classes
      [Solaris::Inverters::Huawei]
    end
  end
end

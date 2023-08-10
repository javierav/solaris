module Solaris
  module Inverters
    class Base
      def self.available?
        raise NotImplementedError
      end

      def self.read
        new.read
      end

      def read
        raise NotImplementedError
      end
    end
  end
end

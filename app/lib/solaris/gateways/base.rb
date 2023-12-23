module Solaris
  module Gateways
    # TODO, ver si esto se puede unificar en Solaris::Gateway
    class Base
      def close
        raise NotImplementedError
      end

      def read(*)
        raise NotImplementedError
      end
    end
  end
end

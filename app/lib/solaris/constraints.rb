module Solaris
  class Constraints
    class << self
      def matches?(request)
        candidates(request).all? do |param|
          send("match_#{param}?", request)
        end
      end

      def candidates(request)
        %i[period chart indicator].select { |param| request.params.include?(param) }
      end

      def match_indicator?(request)
        request.params[:indicator].in?(Solaris::Indicators.all.map(&:id))
      end

      def match_chart?(request)
        request.params[:chart].in?(Solaris::Charts.all.map(&:id))
      end

      def match_period?(request)
        [
          /\d{4}-\d{2}-\d{2}\:\d{4}-\d{2}-\d{2}/,
          /\d{4}-\d{2}-\d{2}/,
          /\d{4}-W\d{2}/,
          /\d{4}-\d{2}/,
          /\d{4}/,
          /all/,
          /now/
        ].any? { |pattern| request.params[:period].match?(pattern) }
      end
    end
  end
end

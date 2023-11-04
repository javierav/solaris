module Solaris
  module Identificable
    extend ActiveSupport::Concern

    module ClassMethods
      def id
        name.underscore.split("/").last
      end

      def dom_id
        [id, name.deconstantize.underscore.split("/").last.singularize].join("_")
      end
    end

    def id
      self.class.id
    end

    def dom_id
      self.class.dom_id
    end
  end
end

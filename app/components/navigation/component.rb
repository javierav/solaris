module Navigation
  class Component < ViewComponent::Base
    renders_many :items, "Item"

    class Item < ViewComponent::Base
      attr_reader :name, :href, :current

      def initialize(name:, href:, current:)
        @name = name
        @href = href
        @current = current
      end

      def call
        link_to name, href, class: css_classes.render(current:)
      end

      private

      def css_classes
        ClassVariants.build(
          "rounded-md px-3 py-2 text-sm font-medium",
          variants: {
            "current": "bg-gray-900 text-white",
            "!current": "text-gray-300 hover:bg-gray-700 hover:text-white"
          },
          defaults: {
            current: false
          }
        )
      end
    end
  end
end

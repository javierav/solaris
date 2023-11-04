module Dropdown
  class Component < ViewComponent::Base
    renders_many :options, ->(**kwargs) {
      @options_index += 1
      Dropdown::Component::Options.new(**kwargs.merge(index: @options_index - 1))
    }

    def initialize(options)
      @options = options
      @options_index = 0
      with_options(options)
    end

    def current
      @options.select { |o| o[:current] }.first[:name]
    end

    class Options < ViewComponent::Base
      def initialize(name:, href:, current:, index:)
        @name = name
        @href = href
        @current = current
        @index = index
      end

      def call
        link_to @name, @href, class: "block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 hover:text-gray-900", role: "menuitem", tabindex: @index, data: { dropdown_target: "menuItem" }
      end
    end
  end
end

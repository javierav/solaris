module Loops
  class Main
    def self.run(store)
      new(store).run
    end

    def initialize(store)
      @store = store
    end

    def run
      @store.set(Inverter.read)
    end
  end
end

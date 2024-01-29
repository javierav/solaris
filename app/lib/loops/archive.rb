module Loops
  class Archive
    def self.run(store)
      new(store).run
    end

    def initialize(store)
      @store = store
    end

    def run
      ::Archive.create!(@store.get.merge(datetime: Time.current))
    end
  end
end

module CoreExtensions
  module Array
    def to_enum_hash
      to_h { |e| [e.to_s, e.to_s] }
    end
  end
end

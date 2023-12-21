module Sqideable
  extend ActiveSupport::Concern

  ALPHABET = "abcdefghijklmnopqrstuvwxyz0123456789".freeze
  MIN_LENGTH = 10

  module ClassMethods
    def sqid
      @sqid ||= Sqids.new(alphabet: ALPHABET, min_length: MIN_LENGTH)
    end

    def from_sqid(id)
      find(sqid.decode(id).first)
    end
  end

  def to_param
    self.class.sqid.encode([id])
  end
end

class Inverter < ApplicationRecord
  include Sqideable

  enum :installation_type, %i[domestic other].to_enum_hash

  belongs_to :protocol
  belongs_to :zone

  validates :name, presence: true
  validates :installation_type, presence: true
end

class Inverter < ApplicationRecord
  include Sqideable

  belongs_to :protocol

  validates :name, presence: true
  validates :timezone, presence: true
end

class Rate < ApplicationRecord
  belongs_to :inverter

  validates :start_at, presence: true, uniqueness: { scope: :inverter_id }
end

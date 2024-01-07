class AvailableRate < ApplicationRecord
  belongs_to :country

  validates :rate, presence: true, uniqueness: { scope: :country_id }
end

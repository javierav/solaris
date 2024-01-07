class Zone < ApplicationRecord
  belongs_to :country

  validates :name, presence: true, uniqueness: { scope: :country_id }
  validates :timezone, presence: true
end

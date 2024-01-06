class Holiday < ApplicationRecord
  belongs_to :country

  validates :name, presence: true
  validates :date, presence: true, uniqueness: { scope: :country_id }
end

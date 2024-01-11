class Holiday < ApplicationRecord
  validates :date, presence: true, uniqueness: true
  validates :name, presence: true
end

class Country < ApplicationRecord
  has_many :available_rates, dependent: :destroy
  has_many :holidays, dependent: :destroy
  has_many :zones, dependent: :destroy

  validates :code, presence: true, uniqueness: true
  validates :name, presence: true
  validates :p1_name, presence: true
  validates :p2_name, presence: true
  validates :p3_name, presence: true
end

class Cost < ApplicationRecord
  belongs_to :country

  validates :start_at, presence: true
  validates :transport_toll_p1, presence: true
  validates :distribution_toll_p1, presence: true
  validates :charges_p1, presence: true
  validates :transport_toll_p2, presence: true
  validates :distribution_toll_p2, presence: true
  validates :charges_p2, presence: true
  validates :transport_toll_p3, presence: true
  validates :distribution_toll_p3, presence: true
  validates :charges_p3, presence: true

  def self.for_time(time)
    where('start_at <= ?', time).order(start_at: :desc).first
  end
end

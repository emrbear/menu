class Carte < ApplicationRecord

  validates :title,    presence: true
  validates :subtitle, presence: true
  validates :position, presence: true, numericality: true

  scope :by_position, ->(){ order(:position) }
end

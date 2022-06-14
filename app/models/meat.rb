class Meat < ApplicationRecord
  has_many :orders, dependent: :nullify

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: true
  validates :calories, presence: true, numericality: true
end

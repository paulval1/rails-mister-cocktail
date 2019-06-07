class Ingredient < ApplicationRecord
  has_many :doses
  has_many :ingredients, through: :doses
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end

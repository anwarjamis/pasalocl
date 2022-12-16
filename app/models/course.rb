class Course < ApplicationRecord
  has_many :topics, dependent: :destroy
  has_many :lessons, through: :topics

  validates :name, uniqueness: true
end

class University < ApplicationRecord
  has_many :users

  validates :name, uniqueness: true
  validates :initials, uniqueness: true
end

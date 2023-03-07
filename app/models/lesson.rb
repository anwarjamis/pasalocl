class Lesson < ApplicationRecord
  belongs_to :topic
  has_one_attached :asset
  has_many :views
end

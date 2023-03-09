class Lesson < ApplicationRecord
  belongs_to :topic
  has_many :views
end

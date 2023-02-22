class Lesson < ApplicationRecord
  belongs_to :topic
  has_one_attached :asset
  has_many :views

  def increment_views_for(user)
    # Buscar el registro de VIew correspondiente al usuario y al curso
    user_course = self.views.find_or_initialize_by(user: user)

    # Si el usuario no ha visto el curso hoy, se incrementa el contador
    if user_course.last_viewed_at.nil? || user_course.last_viewed_at < 24.hours.ago
      user_course.views += 1
      user_course.last_viewed_at = Time.now
      user_course.save
    end
  end
end

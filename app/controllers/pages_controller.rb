class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @courses = Course.all
    @lessons = Lesson.all
    redirect_to courses_path if user_signed_in?
  end

  def admin
  end

  def subscribe
  end
end

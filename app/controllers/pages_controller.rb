class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @courses = Course.all
    @lessons = Lesson.all
    redirect_to courses_path if user_signed_in?
  end

  def admin
    @users = User.count.to_f
    @subscribed = User.where(subscribed: true).count
    @subscribed_p = ((@subscribed / @users) * 100).to_i
    @active_users = User.where('last_sign_in_at > ?', Time.now - 7.days).count.to_f
    @active_users_p = ((@active_users / @users) * 100).to_i
  end

  def subscribe
  end

  def feedback
  end
end

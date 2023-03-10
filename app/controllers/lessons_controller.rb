class LessonsController < ApplicationController
  before_action :set_lesson, only: %i[show edit update destroy]
  before_action :pundit_auth, except: %i[index new create]

  def index
    @lessons = policy_scope(Lesson)
    authorize @lessons
  end

  def show
    @topic = Topic.where(id: @lesson.topic_id).first
    @course = Course.where(id: @topic.course_id).first

    @lesson = Lesson.find(params[:id])
    increment_views_for(@lesson)
    @user_views = View.where(lesson_id: @lesson).count
  end

  def new
    @lesson = Lesson.new
    authorize @lesson
  end

  def create
    @lesson = Lesson.new(lesson_params)
    authorize @lesson
    if @lesson.save
      redirect_to lessons_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @lesson.update(lesson_params)
      redirect_to @lesson
    else
      render 'edit'
    end
  end

  def destroy
    @lesson.destroy
    redirect_to lessons_path
  end

  private

  def set_lesson
    @lesson = Lesson.find(params[:id])
  end

  def pundit_auth
    authorize @lesson
  end

  def lesson_params
    params.require(:lesson).permit(:title, :description, :time, :topic_id, :free, :category, :vimeo)
  end

  def increment_views_for(lesson)
    last_user_view = View.where(user_id: current_user, lesson_id: lesson).last
    return unless last_user_view.nil? || last_user_view.last_viewed_at < 24.hours.ago

    now = DateTime.now
    View.create(user_id: current_user.id, last_viewed_at: now, lesson_id: lesson.id)
  end
end

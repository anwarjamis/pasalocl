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
    @lesson.increment_views_for(current_user)
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
    params.require(:lesson).permit(:title, :description, :time, :topic_id, :asset, :free, :category)
  end
end

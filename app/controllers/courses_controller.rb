class CoursesController < ApplicationController
  before_action :set_course, only: %i[show edit update destroy]
  before_action :pundit_auth, except: %i[index new create]

  def index
    @courses = Course.all
    @courses = policy_scope(Course)
    @topics = Topic.all
  end

  def show
    @topics = Topic.where(course_id: @course)
    @lessons = Lesson.all
  end

  def new
    @course = Course.new
    authorize @course
  end

  def create
    @course = Course.new(course_params)
    authorize @course
    if @course.save
      redirect_to courses_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @course.update(course_params)
      redirect_to @course
    else
      render 'edit'
    end
  end

  def destroy
    @course.destroy
    redirect_to courses_path
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def pundit_auth
    authorize @course
  end

  def course_params
    params.require(:course).permit(:name, :description, :short)
  end
end

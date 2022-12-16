class TopicsController < ApplicationController
  before_action :set_topic, only: %i[show edit update destroy]
  before_action :pundit_auth, except: %i[index new create]

  def index
    @topics = policy_scope(Topic)
    authorize @topics
  end

  def show
    @lessons = Lesson.where(topic_id: @topic)
  end

  def new
    @topic = Topic.new
    authorize @topic
  end

  def create
    @topic = Topic.new(topic_params)
    authorize @topic
    if @topic.save
      redirect_to topics_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @topic.update(topic_params)
      redirect_to @topic
    else
      render 'edit'
    end
  end

  def destroy
    @topic.destroy
    redirect_to topics_path
  end

  private

  def set_topic
    @topic = Topic.find(params[:id])
  end

  def pundit_auth
    authorize @topic
  end

  def topic_params
    params.require(:topic).permit(:title, :description, :course_id)
  end
end

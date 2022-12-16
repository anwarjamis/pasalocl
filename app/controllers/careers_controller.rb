class CareersController < ApplicationController
  before_action :set_career, only: %i[show edit update destroy]
  before_action :pundit_auth, except: %i[index new create]

  def index
    @careers = policy_scope(Career)
  end

  def show
  end

  def new
    @career = Career.new
    authorize @career
  end

  def create
    @career = Career.new(career_params)
    authorize @career
    if @career.save
      redirect_to careers_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @career.update(career_params)
      redirect_to @career
    else
      render 'edit'
    end
  end

  def destroy
    @career.destroy
    redirect_to careers_path
  end

  private

  def set_career
    @career = Career.find(params[:id])
  end

  def pundit_auth
    authorize @career
  end

  def career_params
    params.require(:career).permit(:name)
  end
end

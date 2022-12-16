class UniversitiesController < ApplicationController
  before_action :set_university, only: %i[show edit update destroy]
  before_action :pundit_auth, except: %i[index new create]

  def index
    @universities = policy_scope(University)
    authorize @universities
  end

  def show
  end

  def new
    @university = University.new
    authorize @university
  end

  def create
    @university = University.new(university_params)
    authorize @university
    if @university.save
      redirect_to universities_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @university.update(university_params)
      redirect_to @university
    else
      render 'edit'
    end
  end

  def destroy
    @university.destroy
    redirect_to universities_path
  end

  private

  def set_university
    @university = University.find(params[:id])
  end

  def pundit_auth
    authorize @university
  end

  def university_params
    params.require(:university).permit(:name, :initials)
  end
end

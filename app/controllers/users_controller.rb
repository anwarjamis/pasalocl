class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]
  before_action :pundit_auth, except: [:index]

  def index
    @users = policy_scope(User)
    authorize @users
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def pundit_auth
    authorize @user
  end

  def user_params
    params.require(:user).permit(:admin, :subscribed, :name, :last_name, :phone_number, :university_id, :career_id)
  end
end

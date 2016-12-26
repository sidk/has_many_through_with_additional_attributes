class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
    @user.user_groups.build
  end

  def edit
    user
    user.user_groups.build unless user.user_groups.build.present?
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to users_path
  end

  def update
    user.update(user_params)
    redirect_to users_path
  end

  private

  def user
    @user ||= User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, user_groups_attributes: [:id, :user_id, :group_id, :admin, :_destroy])
  end
end

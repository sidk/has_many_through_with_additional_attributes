class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
    user
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
    params.require(:user).permit(:name)
  end

  def build_user_groups
    Group.all.each do |group|
      user.user_groups.build(group_id: group.id)
    end
  end
end

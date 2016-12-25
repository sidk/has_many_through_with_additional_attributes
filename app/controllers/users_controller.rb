class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def edit
    user
    build_user_groups
  end

  def update
    user.update(user_params)
    render :edit
  end

  private

  def user
    @user ||= User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(group_ids: [])
  end

  def build_user_groups
    Group.all.each do |group|
      user.user_groups.build(group_id: group.id)
    end
  end
end

class UsersController < ApplicationController
  def edit
    user
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
end

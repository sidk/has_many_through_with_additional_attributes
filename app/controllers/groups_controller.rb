class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def edit
    group
  end

  def update
    group.update(group_params)
    render :edit
  end

  private

  def group
    @group ||= Group.find(params[:id])
  end

  def group_params
    params.require(:group)
      .permit(user_groups_attributes: [:admin, :id])
  end
end

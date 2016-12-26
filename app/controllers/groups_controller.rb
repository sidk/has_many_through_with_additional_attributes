class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def edit
    group
  end

  def create
    @group = Group.new(group_params)
    @group.save
    redirect_to groups_path
  end

  def update
    group.update(group_params)
    redirect_to groups_path
  end

  private

  def group
    @group ||= Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name)
  end
end

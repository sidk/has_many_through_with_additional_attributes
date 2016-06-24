class GroupAssignmentsController < ApplicationController
  def edit
    @group_assignment = GroupAssignment::FormObject.new(params[:id])
  end

  def update
    @group_assignment = GroupAssignment::FormObject
                          .new(params[:id], group_assignment_params[:user_groups_attributes])
    @group_assignment.save
    render :edit
  end

  private
  
  def group_assignment_params
    params.require(:group_assignment).permit(user_groups_attributes: [:group_id, :admin])
  end  
end

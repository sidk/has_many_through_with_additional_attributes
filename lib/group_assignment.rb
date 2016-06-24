GroupAssignment = Struct.new(:group_id, :user_id, :admin) do  
  def assign_admin
    user_group.update(admin: admin)
  end
  
  private
  
  def user_group
    UserGroup.find_by(group_id: group_id, user_id: user_id)
  end
end
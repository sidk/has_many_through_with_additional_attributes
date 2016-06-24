class GroupAssignment
  class FormObject
    include ActiveModel::Model

    attr_accessor :user_id, :user_groups_attributes

    def initialize(user_id, group_assignment_attributes = {})
      self.user_id = user_id
      self.user_groups_attributes = group_assignment_attributes
    end

    def self.model_name
      ActiveModel::Name.new(self, nil, 'GroupAssignment')
    end

    def save
      user.update(group_ids: group_ids)
      group_assignments.map(&:assign_admin)
      true
    end
    
    def user_groups
      Group.all.map do |group|
        UserGroup.find_or_initialize_by(user_id: user_id, group_id: group.id)
      end
    end
    
    private
    
    def group_ids
      group_assignments.map(&:group_id)
    end
    
    def group_assignments
      user_groups_attributes.values.map do |group_assignment_hash|
        GroupAssignment
          .new(group_assignment_hash[:group_id],
               user_id,
               group_assignment_hash[:admin]
              ) unless group_assignment_hash[:group_id].to_i.zero?
      end.compact
    end
    
    def user
      @user ||= User.find(user_id)
    end
  end
end
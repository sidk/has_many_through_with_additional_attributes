class User < ActiveRecord::Base
  has_many :user_groups
  has_many :groups, through: :user_groups
  accepts_nested_attributes_for :user_groups, reject_if: :reject_user_group,
                                              allow_destroy: true

  # Related to accepts_nested_attributes
  def reject_user_group(attr)
    attr['group_id'].blank?
  end
end

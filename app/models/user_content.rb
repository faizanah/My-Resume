class UserContent < ApplicationRecord

  belongs_to :admin_user
  belongs_to :content
  scope :visible , -> {where is_visible: true }

  acts_as_list scope: :admin_user
  scope :position_desc , -> {order(position: :asc)}

end

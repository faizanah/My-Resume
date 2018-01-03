class Achievement < ApplicationRecord

  belongs_to :admin_user
  validates :title , :icon , :admin_user , presence: true
  default_scope -> {order(date: :desc)}
end

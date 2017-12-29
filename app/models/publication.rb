class Publication < ApplicationRecord
  belongs_to :admin_user
  validates :title , :admin_user , presence: true
end

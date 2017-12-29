class Interest < ApplicationRecord

  belongs_to :admin_user
  validates :title , :icon , :admin_user , presence: true

end

class Interest < ApplicationRecord

  belongs_to :admin_user
  validates :name , :icon , :admin_user , presence: true

end

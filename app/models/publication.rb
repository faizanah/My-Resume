class Publication < ApplicationRecord

  validates :title, presence: true ,  length: {minimum: 3, maximum: 200}
  validates :publication_url, url: true , allow_blank: true
  validates :description , :publisher, presence: true

  belongs_to :admin_user
  validates :title , :admin_user , presence: true

  acts_as_list scope: :admin_user

end

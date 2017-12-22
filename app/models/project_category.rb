class ProjectCategory < ApplicationRecord

  validates :name, presence: true ,  length: {minimum: 3, maximum: 50}

  belongs_to :admin_user
  has_and_belongs_to_many :projects

end

class ProjectCategory < ApplicationRecord

  validates :name, presence: true ,  length: {minimum: 3, maximum: 50}

  belongs_to :admin_user
  has_and_belongs_to_many :projects

  acts_as_list scope: :admin_user
  scope :position_desc , -> {order(position: :asc)}
end

class SkillType < ApplicationRecord
  validates :name, presence: true ,  length: {minimum: 3, maximum: 50}

  belongs_to :admin_user
  has_many :skills , dependent: :destroy
  accepts_nested_attributes_for :skills, allow_destroy: true

  acts_as_list scope: :admin_user
  scope :position_desc , -> {order(position: :asc)}
end

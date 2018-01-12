class MediaLink < ApplicationRecord
  validates :name, presence: true ,  length: {minimum: 3, maximum: 50}
  validates :url, url: true , presence: true
  validates :icon, presence: true

  belongs_to :admin_user
  has_one :profile, through: :admin_user
  acts_as_list scope: :admin_user
  scope :position_desc , -> {order(position: :asc)}
end

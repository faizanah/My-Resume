class Content < ApplicationRecord
  # belongs_to :admin_user
  validates :name , :value , presence: true
  has_many :user_contents , dependent: :destroy
  has_many :admin_users , through: :user_contents

  scope :visible , -> {includes(:user_contents).where('user_contents.is_visible = ? ' , true)}

  after_create :link_to_all_admin_users

  private

  def link_to_all_admin_users
    AdminUser.all.each do |user|
      self.user_contents.create!({position: self.id , admin_user_id: user.id})
    end
  end
end

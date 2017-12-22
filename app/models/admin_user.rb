class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable
  has_one  :profile
  has_many :experiences
  has_many :educations
  has_many :skills
  has_many :skill_types
  has_many :project_categories
  has_many :projects
  has_many :contacts , dependent: :destroy

  after_create :set_profile

  private

  def set_profile
    Profile.create!(email: email , admin_user_id:  id)
  end
end

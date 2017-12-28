class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable
  has_one  :profile, dependent: :destroy
  has_many :experiences, dependent: :destroy
  has_many :educations, dependent: :destroy
  has_many :skills, dependent: :destroy
  has_many :skill_types, dependent: :destroy
  has_many :project_categories, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :contacts , dependent: :destroy
  has_many :interests , dependent: :destroy
  has_many :user_contents , dependent: :destroy
  has_many :contents , through: :user_contents

  after_create :set_profile
  after_create :create_default_settings

  private

  def set_profile
    Profile.create!(email: email , admin_user_id:  id)
  end

  def create_default_settings
      Content.all.each do |content|
        self.user_contents.create!({position: content.id , content_id: content.id})
      end
  end

end

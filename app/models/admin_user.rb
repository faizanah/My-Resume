class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable
  has_one  :profile             , dependent: :destroy
  has_many :experiences         , dependent: :destroy
  has_many :educations          , dependent: :destroy
  has_many :skills              , dependent: :destroy
  has_many :skill_types         , -> { order(position: :asc) } , dependent: :destroy
  has_many :project_categories  , -> { order(position: :asc) } , dependent: :destroy
  has_many :user_contents       , -> { order(position: :asc) } , dependent: :destroy
  has_many :media_links         , -> { order(position: :asc) } , dependent: :destroy
  has_many :projects            , dependent: :destroy
  has_many :contacts            , dependent: :destroy
  has_many :interests           , dependent: :destroy
  has_many :services            , dependent: :destroy
  has_many :achievements        , dependent: :destroy
  has_many :publications        , dependent: :destroy
  has_many :contents            , through: :user_contents

  after_create :set_profile
  after_create :create_default_settings

  accepts_nested_attributes_for :media_links, allow_destroy: true

  private

  def set_profile
    Profile.create!(email: email , admin_user_id:  id , theme_id: Theme.first.id)
  end

  def create_default_settings
      Content.all.each do |content|
        self.user_contents.create!({position: content.id , content_id: content.id})
      end
  end

end

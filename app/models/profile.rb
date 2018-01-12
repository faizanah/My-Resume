class Profile < ApplicationRecord

  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i } , presence: true
  validates_format_of :full_name, :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/  , on: :update
  validates :web_url , url: true , allow_blank: true , on: :update
  validates_format_of :phone, :with =>  /\d[0-9]\)*\z/ , message: "Only positive number without spaces are allowed" , allow_blank: true , on: :update
  mount_uploader :image, PictureUploader
  mount_uploader :resume, DocumentUploader

  validate :resume_size_validation
  validate :image_size_validation


  belongs_to :admin_user
  belongs_to :theme

  before_create :set_default_theme

  accepts_nested_attributes_for :admin_user


  private

  def set_default_theme
    self.theme_id = Theme.first
  end

  def image_size_validation
    errors[:image] << "should be less than 2MB" if image.size > 2.megabytes
  end

  def resume_size_validation
    errors[:resume] << "should be less than 2MB" if resume.size > 5.megabytes
  end

end

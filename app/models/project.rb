class Project < ApplicationRecord

  validates :title, presence: true ,  length: {minimum: 3, maximum: 150}
  validates :url, url: true , allow_blank: true

  belongs_to :admin_user

  has_and_belongs_to_many :project_categories
  mount_uploader :image, ProjectUploader

  has_many :attachments, as: :attached_item, dependent: :destroy
  # has_many :attachments, class_name: "Attachment" , foreign_key: :attached_item_id

  accepts_nested_attributes_for :project_categories
  accepts_nested_attributes_for :attachments, allow_destroy: true

end

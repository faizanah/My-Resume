class Attachment < ActiveRecord::Base
  mount_uploader :attachment, ProjectUploader

  # Associations

  belongs_to :attached_item, polymorphic: true
  # belongs_to :project, class_name: "Project" , foreign_key: :attached_item_id

  # Validations

  # validates_presence_of :attachment
  # validates_integrity_of :attachment

  # Callbacks

  before_save :update_attachment_attributes

  # Delegate

  delegate :url, :size, :path, to: :attachment

  # Virtual attributes

  alias_attribute :filename, :original_filename

  private

  def update_attachment_attributes
    if attachment.present? && attachment_changed?
      self.original_filename = attachment.file.original_filename
      self.content_type = attachment.file.content_type
    end
  end
end
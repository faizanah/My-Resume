class Project < ApplicationRecord

  validates :title, presence: true ,  length: {minimum: 3, maximum: 150}
  validates :url, url: true , allow_blank: true

  belongs_to :admin_user
  has_and_belongs_to_many :project_categories

  has_many :attachments, as: :attached_item, dependent: :destroy

  accepts_nested_attributes_for :project_categories
  accepts_nested_attributes_for :attachments, allow_destroy: true, reject_if: proc { |attributes| attributes[:attachment].nil? }
end

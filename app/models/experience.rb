class Experience < ApplicationRecord

  mount_uploader :logo, PictureUploader

  validates :organization_url, url: true , allow_blank: true
  validates :job_title, presence: true
  validates :organization_name, presence: true

  validate  :end_after_start
  validates :period_start, presence: true
  validate :image_size_validation

  belongs_to :admin_user
  has_many :lists, as: :listable, dependent: :destroy
  accepts_nested_attributes_for :lists, allow_destroy: true
  default_scope -> {order(period_start: :desc)}

  private

  def image_size_validation
    errors[:logo] << "should be less than 500KB" if logo.size > 0.5.megabytes
  end

  def end_after_start
    errors.add(:period_start, "Start date cannot be in future.") if period_start > Date.today
    return if period_end.blank?
    errors.add(:period_end, "End date cannot be in future.") if period_end > Date.today
    errors.add(:period_end, "End date must be after the start date") if period_end < period_start
  end

end

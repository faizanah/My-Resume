class Experience < ApplicationRecord

  # validates :organization_url, url: true , allow_blank: true , presence: true
  validates :job_title, presence: true
  validates :organization_name, presence: true

  validate  :end_after_start
  validates :period_start, presence: true

  belongs_to :admin_user

  default_scope -> {order(period_start: :desc)}

  private

  def end_after_start
    errors.add(:period_start, "Start date cannot be in future.") if period_start > Date.today
    return if period_end.blank?
    errors.add(:period_end, "End date cannot be in future.") if period_end > Date.today
    errors.add(:period_end, "End date must be after the start date") if period_end < period_start
  end

end

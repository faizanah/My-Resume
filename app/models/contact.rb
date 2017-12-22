class Contact < ApplicationRecord

  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i } , presence: true
  validates :name,format: {with: /\A[^0-9`!@#\$%\^&*+_=]+\z/}  , presence: true
  validates :subject , :message , :admin_user ,presence: true

  belongs_to :admin_user

  scope :recent , -> {order(created_at: :desc).limit(5)}

  after_create :send_email

  private

  def send_email
    ContactUsMailer.send_email(self).deliver
  end

end
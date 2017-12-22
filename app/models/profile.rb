class Profile < ApplicationRecord

  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i } , presence: true
  validates_format_of :full_name, :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/  , on: :update
  validates :web_url, url: true , allow_blank: true , on: :update
  validates_format_of :phone, :with =>  /\d[0-9]\)*\z/ , :message => "Only positive number without spaces are allowed" , allow_blank: true , on: :update

  belongs_to :admin_user
  # belongs_to :theme


end

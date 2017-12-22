class Theme < ApplicationRecord

  validates :name, :value , presence: true

  has_many :profiles
end

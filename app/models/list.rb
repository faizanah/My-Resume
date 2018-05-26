class List < ApplicationRecord

  belongs_to :listable, polymorphic: true
  validates :description, presence: true

end

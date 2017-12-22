class Skill < ApplicationRecord

  validates :name, presence: true ,  length: {minimum: 3, maximum: 150}
  validates :score , presence: true , numericality: {greater_than_or_equal_to: 0.0, less_than_or_equal_to: 10.0}

  belongs_to :admin_user
  belongs_to :skill_type

end

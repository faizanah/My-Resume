class UserContent < ApplicationRecord

  belongs_to :admin_user
  belongs_to :content
  scope :visible , -> {where is_visible: true }
  scope :position_asc , -> {order position: :asc }

  def  insert_at(possition)
    puts possition, '-----------------------'
  end

end

class ProfileDecorator < ApplicationDecorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def theme_name
    # object.theme.present? ? object.theme.value : 'style-grey.css'
    'style-grey.css'
  end

  def picture
    h.image_tag object.image.present? ? object.image : 'noimage.png'
  end
end

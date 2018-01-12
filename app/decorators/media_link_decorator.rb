class MediaLinkDecorator < ApplicationDecorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def link
    h.content_tag :li do
      h.link_to h.content_tag(:i, '' , class: object.icon ) ,  object.url , target: "_blank" , title: object.name
    end
  end

end

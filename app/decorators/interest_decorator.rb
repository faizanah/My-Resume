class InterestDecorator < ApplicationDecorator
  delegate_all

  def display
    h.content_tag :li , class: 'interest-topic' do
      h.content_tag(:i , '' ,class: object.icon) + h.content_tag(:span , object.title)
    end
  end

end

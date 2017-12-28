class ContentDecorator < ApplicationDecorator
  delegate_all

  def link
    h.content_tag :li do
      h.link_to object.name , "#" + object.value
    end
  end

  def nav_link
    h.content_tag :li do
      h.link_to object.name , "#" + object.value , class: 'nav-link'
    end
  end
  def partial
    h.render "home/partials/#{self.value}" , content: self
  end

  def title
    h.content_tag(:h4 , object.name  , class: 'text-uppercase text-center')
  end
end

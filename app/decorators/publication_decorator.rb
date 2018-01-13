class PublicationDecorator < ApplicationDecorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def publication_link
    h.link_to "Read Now" , object.publication_url , title: 'Read Now' , class: 'btn waves-effect waves-light btn-primary custom-btn' , target: '_blank'
  end

  def publisher_name
      h.content_tag(:i , '' ,class: 'ion-ios-pricetag') + h.content_tag(:span ,"Publisher: #{object.publisher}")
  end

  def published_on
    h.content_tag(:i,'', class: 'ion-calendar') + h.content_tag(:span , "Published On: #{object.publication_date.strftime("%B %Y")}" )
  end
end
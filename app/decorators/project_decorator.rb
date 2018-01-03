class ProjectDecorator < ApplicationDecorator
  delegate_all

  def modal_id
    "modal-#{object.id}"
  end

  def demo_link
    h.link_to "Live Demo" , object.url , class: 'btn modal-btn waves-effect waves-light btn-primary custom-btn' , target: '_blank'
  end

  def modal_link
    h.link_to h.content_tag(:figcaption , h.content_tag(:span , "View Details")) , "#0" , data: {"target": "#" + modal_id , "toggle": "modal"}
  end

  def modal_image
    h.image_tag object.image , alt: object.title , class: 'img-responsive col-md-8 col-sm-12 col-xs-12'
  end

  def catageories
    object.project_categories.ids.join(' , ')
  end

  def responsive_image
    h.image_tag object.image , alt: object.title , class: 'img-responsive' , style: 'max-width: 250px !important; max-height: 115px !important;'
  end

  def modal
    h.render 'projects/partials/modal' , project: self
  end

end

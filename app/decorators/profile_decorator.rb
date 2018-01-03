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
    object.theme.present? ? object.theme.value : 'style-grey.css'
  end

  def head_title
    title = ''
    title = object.full_name + ' - ' if not object.full_name.nil?
    title += object.title if not object.title.nil?
    h.content_tag(:title , title)
  end

  def picture
    h.image_tag object.image.present? ? object.image : 'noimage.png'
  end

  def cv_download_button
    h.link_to "Download CV" , object.resume.url , class: 'btn waves-effect waves-light btn-primary custom-btn' , download: object.resume.url
  end
  def contact_me_button
    h.link_to "Contact Me" , "#contact" , class: 'btn waves-effect waves-light btn-primary custom-btn'
  end

  def linkedin_link
    h.content_tag :li do
      h.link_to h.content_tag(:i, '' , class: 'ion-social-linkedin') ,  object.linkedin_url,target: "_blank" , title: "LinkedIn"
    end if object.linkedin_url.present?
  end

  def facebook_link
    h.content_tag :li do
      h.link_to h.content_tag(:i, '' , class: 'ion-social-facebook') , object.facebook_url ,target: "_blank" , title: "Facebook"
    end if object.facebook_url.present?
  end

  def git_link
    h.content_tag :li do
      h.link_to h.content_tag(:i, '' , class: 'ion-social-github') , object.git_url ,target: "_blank" , title: "Git"
    end if object.git_url.present?
  end
end

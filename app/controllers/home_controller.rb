class HomeController < ApplicationController

  def index
    set_meta_tags title: current_profile.full_name,
                  site: current_profile.full_name,
                  reverse: true,
                  description: current_profile.about,
                  keywords: "resume , online resume , ruby on rails developer",
                  twitter: {
                      card: current_profile.about,
                      site: current_profile.full_name,
                      title: current_profile.full_name,
                      description:  current_profile.about,
                      image: current_profile.image
                  },
                  og: {
                      title:    current_profile.full_name,
                      description: current_profile.about,
                      type:     'website',
                      url:      root_url,
                      image:    current_profile.image
                  }

    @contact_us    = current_user.contacts.new
    @contents      = current_user.contents.visible.decorate || []
  end

end

class HomeController < ApplicationController

  def index
    set_meta_tags title: current_profile.full_name,
                  site: current_profile.full_name,
                  reverse: true,
                  description: current_profile.about,
                  keywords: "resume , online resume , ruby on rails developers",
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
    @experiences   = current_user.experiences.all.decorate || []
    @educations    = current_user.educations.all.decorate || []
    @skill_types   = current_user.skill_types.includes(:skills) || []
    @project_types = current_user.project_categories || []
    @projects      = current_user.projects.includes(:project_categories).decorate || []
  end

end

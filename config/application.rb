require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Resume
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.assets.paths << Rails.root.join('app', 'assets', 'fonts' , 'roboto')
    config.assets.paths << Rails.root.join("app", "assets", "fonts")
    config.assets.precompile << /\.(?:svg|eot|woff|ttf)$/
    config.autoload_paths += %W(#{config.root}/app/models/ckeditor)

    CONTENT_LIST = [
        {name: 'Experience' ,value: 'experiences' },
        {name: 'Skills' , value: 'skills' },
        {name: 'Education' , value: 'educations' },
        {name: 'Services'  , value: 'services' },
        {name: 'Projects / Portfolios' ,  value: 'portfolios'},
        {name: 'Achievement' , value: 'achievements'},
        {name: 'Publications' ,  value: 'publications'},
        {name: 'Blog' ,  value: 'blogs'},
        {name: 'Clients' , value: 'clients'},
        {name: 'Pricing' ,  value: 'pricing'},
        {name: 'Interest' , value: 'interests'}
    ]

    THEMES = [
        {name: 'Red' , color: '#e53935' , value: 'style-red.css' },
        {name: 'Pink' , color: '#E91E63' , value: 'style-pink.css' },
        {name: 'Purple' , color: '#9C27B0' , value: 'style-purple.css' },
        {name: 'Deep Purple' , color: '#673AB7' , value: 'style-deep-purple.css' },
        {name: 'Indigo' , color: '#3F51B5' , value: 'style-indigo.css' },
        {name: 'Blue' , color: '#2196F3' , value: 'style-blue.css' },
        {name: 'Teal' , color: '#009688' , value: 'style-teal.css' },
        {name: 'Green' , color: '#4CAF50' , value: 'style-green.css' },
        {name: 'Light Green' , color: '#8BC34A' , value: 'style-light-green.css' },
        {name: 'Amber' , color: '#ffb300' , value: 'style-amber.css' },
        {name: 'Orange' , color: '#ff9800' , value: 'style-orange.css' },
        {name: 'Deep Orange' , color: '#FF5722' , value: 'style-deep-orange.css' },
        {name: 'Brown' , color: '#795548' , value: 'style-brown.css' },
        {name: 'Blue Grey' , color: '#455A64' , value: 'style-blue-grey.css' },
        {name: 'Grey' , color: '#424242' , value: 'style-grey.css' },
    ]
  end
end

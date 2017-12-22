# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.

Rails.application.config.assets.precompile += %w(aos.min.js.map style-grey.css style-blue-grey.css style-brown.css style-deep-orange.css style-orange.css style-amber.css style-light-green.css style-green.css style-teal.css style-blue.css
style-indigo.css style-deep-purple.css style-purple.css style-pink.css style-red.css style-deep-orange.css style-grey.css
aos.min.js retina.min.js custom-script.js bootstrap.css.map jquery.filterizr.min.js )

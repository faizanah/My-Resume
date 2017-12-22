source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'pg', '~> 0.18.4'
gem 'rails', '~> 5.0.6'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'slim', '~> 3.0', '>= 3.0.9'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'devise', '~> 4.3'
gem "bourbon"
# gem "active_admin-sortable_tree", "~> 0.2.0"
gem 'draper', '~> 3.0', '>= 3.0.1'
gem 'activeadmin', '~> 1.1.0'
gem 'meta-tags', '~> 2.7'
gem 'arctic_admin', '~> 1.3', '>= 1.3.1'
gem 'carrierwave'
gem 'cloudinary'
gem 'figaro', '~> 1.1', '>= 1.1.1'
group :development, :test do
  gem 'byebug'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem "letter_opener"
end

group :production do
  gem 'lograge'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

source 'https://rubygems.org'


###########
# Base
########
ruby '2.2.3'
gem 'rails', '4.2.0'


###########
# Auth
########
gem 'devise'


###########
# Data Base/Active Record
########
gem 'pg'
gem 'active_model_serializers'


###########
# Styling CSS/SASS/SCSS/ETC
########
gem 'sass-rails', '~> 5.0' # Use SCSS for stylesheets
gem 'bootstrap-sass', '~> 3.3.6'


###########
# Angular assets pulled from rails-assets
########
source 'https://rails-assets.org' do
  gem 'rails-assets-angular', '~> 1.4.8'
  gem 'rails-assets-angular-bootstrap', '~> 0.14.3'
  gem "rails-assets-angular-resource", '~> 1.4.8'
  gem "rails-assets-angular-animate", '~> 1.4.8'
  gem 'rails-assets-angular-ui-router', '0.2.15'
end


###########
# Sys Ops
########
gem 'unicorn'

###########
# MiscDefault Gems
########
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc


###########
# Environment Specifics
########
group :development, :test do
  gem 'pry'

  #######
  # Default Dev-gems
  #####
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring'
end

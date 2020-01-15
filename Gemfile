source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
# Use pg as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
# gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'bootstrap', '~> 4.4.1'
gem 'friendly_id', '~> 5.1.0'
gem 'devise'
gem 'bcrypt-ruby', '3.1.1.rc1', :require => 'bcrypt'
gem 'carrierwave', '>= 1.0.0.rc', '< 2.0'
gem 'will_paginate', '~> 3.1', '>= 3.1.5'
gem 'mina'
gem 'inherited_resources', github: 'activeadmin/inherited_resources'
gem 'activeadmin', :github => 'activeadmin/activeadmin'
gem 'cancan'
gem 'pundit'
gem 'mini_magick'
gem 'annotate'
gem 'redis'

source 'https://rails-assets.org' do
  gem 'rails-assets-tether', '>= 1.3.3'
end


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'mina-puma', require: false
  gem 'rspec-rails'
  gem 'faker'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'capybara'

end

group :production do
  gem 'therubyracer', platforms: :ruby
  gem 'exception_notification'
end

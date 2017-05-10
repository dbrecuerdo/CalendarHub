source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'devise', '~> 4.2'
# Devise dependencies
# gem 'orm_adapter', '~> 0.1'
# gem 'railties','< 5.1','>= 4.1.0'
# gem 'responders', '>= 0'
# gem 'warden', '~> 1.2.3'
# gem 'client_side_validations'
gem 'bootstrap-sass', '~> 3.3.1'
gem 'autoprefixer-rails'
# For windows dev platform
gem 'wdm', '>= 0.1.0' if Gem.win_platform?
# bootstrap-rails
# gem 'bootstrap', '~> 4.0.0.alpha6'
#Sprockets-rails
gem 'sprockets-rails', '>= 2.3.2'
# DateTimePicker: http://eonasdan.github.io/bootstrap-datetimepicker/Installing/
gem 'momentjs-rails', '>= 2.9.0'
gem 'bootstrap3-datetimepicker-rails', '~> 4.14.30'
# Simple Calendar by excid3: https://github.com/excid3/simple_calendar
gem "simple_calendar", "~> 2.0"
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.1'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

group :development, :test do
  gem 'byebug', platform: :mri
end
group :production do
  gem 'pg'
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

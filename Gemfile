source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# --- defaults gems --- #
gem 'rails', '~> 5.2.0'
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
gem 'puma', '~> 3.11'
gem 'uglifier', '>= 1.3.0'
gem 'turbolinks', '~> 5'
gem 'sass-rails', '~> 5.0'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'redis', '~> 4.0'
gem 'bcrypt', '~> 3.1.7'
gem 'capistrano-rails', group: :development
gem 'bootsnap', '>= 1.1.0', require: false

# --- self add gems --- #
gem 'jquery-rails', '~> 4.3', '>= 4.3.3'          # jquery
gem 'font-awesome-rails', '~> 4.7', '>= 4.7.0.4'  # awesome font
gem 'devise', '~> 4.4', '>= 4.4.3'                # user auth
gem 'acts-as-taggable-on', '~> 6.0'               # add tags
gem 'annotate', '~> 2.7', '>= 2.7.4'              # schema writing
gem 'bootstrap', '~> 4.1.1'                       # bootstrap4
gem 'mini_magick', '~> 4.8'                       # image resizing
gem 'fog-aws', '~> 3.0'                           # aws
gem 'carrierwave', '~> 1.2', '>= 1.2.3'           # uploader
gem 'kaminari', '~> 1.1', '>= 1.1.1'              # pagenation
gem 'jquery-ui-rails', '~> 6.0', '>= 6.0.1'       # jquery ui

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'dotenv-rails', '~> 2.5'                    # read env
  gem 'rspec-rails', '~> 3.7', '>= 3.7.2'         # testing
  gem 'factory_bot_rails', '~> 4.10'              # test data
  gem 'faker', '~> 1.8', '>= 1.8.7'               # random data generate
  gem 'database_cleaner', '~> 1.7'                # reset test_database
  gem 'letter_opener_web', '~> 1.3', '>= 1.3.4'   # web mail
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'pry-rails', '~> 0.3.6'
  gem 'pry-byebug', '~> 3.6'
  gem 'pry-doc', '~> 0.13.4'
end

group :test do
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.0.6'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'

gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

# Installed for this project
# gem 'pry', '~> 0.11.3'
# gem install pry
gem 'hirb'
gem 'friendly_id', '~> 5.1.0'
gem 'devise', '~> 4.4', '>= 4.4.1'
gem 'petergate', '~> 1.8', '>= 1.8.1'
gem 'bootstrap', '~> 4.1.0'
gem 'font-awesome-rails', '~> 4.7', '>= 4.7.0.4'
gem 'kaminari', '~> 1.1', '>= 1.1.1'
gem 'jquery-ui-rails', '~> 6.0', '>= 6.0.1'


group :development, :test do
  gem 'byebug', platform: :mri
  # Installed for this project
  gem 'pry-byebug'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

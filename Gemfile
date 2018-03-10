source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.5'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.7'
gem 'rack-cors'
gem 'bcrypt', '~> 3.1.7'
gem 'uglifier'
gem 'active_model_serializers'
# TODO: find out whether i need this gem or not
gem 'decent_exposure', '~> 3.0.0'
gem 'doorkeeper'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara'
  gem 'rubocop'
  gem 'foreman'
  gem 'pry-rails'
  gem 'letter_opener'
end

group :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'rspec-collection_matchers'
  gem 'database_cleaner'
  gem 'shoulda-matchers'
  gem 'faker'
  gem 'simplecov', :require => false
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

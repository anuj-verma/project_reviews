source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.4.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'

# Use postgres as the database for Active Record
gem 'pg'

# Use Puma as the app server
gem 'puma', '~> 3.7'

# Annotate Rails classes with schema and routes info
gem 'annotate'

# A plugin for versioning Rails based RESTful APIs
gem 'versionist'

# ActiveModelSerializers brings convention over configuration to your JSON generation.
gem 'active_model_serializers'

# Automatically generate API documentation from RSpec
gem 'rspec_api_documentation'

# An API documentation reader for RSpec API Documentation
gem 'apitome'

# A library for generating fake data such as names, addresses, and phone numbers.
gem 'faker'

# An easy way to keep your users' passwords secure
gem 'bcrypt'

# JSON Web Token (JWT) is a means of representing claims to be transferred between two parties.
gem 'jwt'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Testing framework
  gem 'rspec-rails'
  #  Factory bot is a fixtures replacement
  gem 'factory_bot_rails'
  # Code coverage
  gem 'simplecov'
  # Database Cleaner is a set of strategies for cleaning your database in Ruby.
  gem 'database_cleaner'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

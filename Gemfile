source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

gem 'bootsnap', '~> 1.18', '>= 1.18.4', require: false
gem 'pg', '~> 1.5.8'
gem 'puma', '~> 6.4', '>= 6.4.2'
gem 'rails', '~> 7.1', '>= 7.1.3'

group :development, :test do
  gem 'bullet', '~> 7.2'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails', '~> 6.4', '>= 6.4.3'
  gem 'ffaker', '~> 2.23'
  gem 'i18n', '~> 1.14', '>= 1.14.5'
  gem 'pry', '~> 0.14.2'
  gem 'rspec-rails', '~> 7.0', '>= 7.0.1'
  gem 'rubocop', '~> 1.66', '>= 1.66.1'
end

group :test do
  gem 'shoulda-matchers', '~> 5.3'
  gem 'simplecov', '~> 0.22.0'
end

group :development do
  gem 'listen', '~> 3.9'
  gem 'spring', '~> 4.2', '>= 4.2.1'
  gem 'spring-watcher-listen', '~> 2.1'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

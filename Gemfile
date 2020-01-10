source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'rails', '~> 6.0.2', '>= 6.0.2.1'
gem 'pg', '~> 1.2.1'
gem 'puma', '~> 4.1'
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 3.9'
  gem 'ffaker', '~> 2.13.0'
  gem 'factory_bot_rails', '~> 5.1.1'
  gem 'pry', '~> 0.12.2'
  gem 'bullet', '~> 6.1.0'
  gem 'i18n', '~> 1.8', '>= 1.8.1'

end

group :test do
   gem 'simplecov', '~> 0.17.1', require: false
   gem 'shoulda-matchers', '~> 4.2.0'
 end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring', '~> 2.1.0'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

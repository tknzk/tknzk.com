# frozen_string_literal: true

source 'https://rubygems.org'

# ruby '2.5.7'
if (v = ENV['CUSTOM_RUBY_VERSION'])
  ruby v
end

gem 'haml'
gem 'puma'
gem 'sinatra'

group :test, :development do
  gem 'rubocop'
  gem 'rubocop-performance'
  gem 'shotgun'
end

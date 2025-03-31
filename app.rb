require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'
  gem 'rails', '~> 7.0.0'
end

require 'rails'
require 'action_controller/railtie'

class TestApp < Rails::Application
  config.root = __dir__
  config.consider_all_requests_local = true
  config.secret_key_base = 'secret'

  routes.draw do
    get '/' => 'test#index'
  end
end

class TestController < ActionController::Base
  def index
    render plain: "Ruby version: #{RUBY_VERSION}\nRails version: #{Rails.version}\nActiveSupport loaded: #{defined?(ActiveSupport) ? 'Yes' : 'No'}"
  end
end

TestApp.initialize!

run Rails.application

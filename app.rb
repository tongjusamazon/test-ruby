require 'bundler/setup'
Bundler.require(:default)

require 'rails'
require 'action_controller/railtie'

class TestApp < Rails::Application
  config.root = __dir__
  config.consider_all_requests_local = true
  config.secret_key_base = 'secret'
  config.eager_load = false

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

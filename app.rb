require 'bundler/setup'
Bundler.require(:default)

require 'rails'
require 'action_controller/railtie'
require 'active_support/all'
require 'logger'

Rails.logger = Logger.new(STDOUT)

class TestApp < Rails::Application
  config.root = __dir__
  config.consider_all_requests_local = true
  config.secret_key_base = 'secret'
  config.eager_load = false
  config.raise_on_unfiltered_parameters = true
  config.logger = Rails.logger

  routes.draw do
    get '/' => 'test#index'
  end
end

class TestController < ActionController::Base
  def index
    render plain: <<~TEXT
      Ruby version: #{RUBY_VERSION}
      Rails version: #{Rails.version}
      ActiveSupport loaded: #{defined?(ActiveSupport) ? 'Yes' : 'No'}
      ActionPack loaded: #{defined?(ActionPack) ? 'Yes' : 'No'}
      ActiveModel loaded: #{defined?(ActiveModel) ? 'Yes' : 'No'}
      Nokogiri loaded: #{defined?(Nokogiri) ? 'Yes' : 'No'}
      Nokogiri version: #{Nokogiri::VERSION rescue 'Not available'}
    TEXT
  end
end

TestApp.initialize!

run TestApp

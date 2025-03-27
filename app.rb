require 'sinatra'

set :bind, '0.0.0.0'
set :port, ENV['PORT'] || 3000

get '/' do
  'Hello from AWS App Runner!'
end

get '/health' do
  'OK'
end

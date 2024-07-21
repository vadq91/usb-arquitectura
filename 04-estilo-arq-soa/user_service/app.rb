require 'sinatra'
require 'json'

set :port, 4001

users = []

get '/users' do
  content_type :json
  users.to_json
end

post '/users' do
  content_type :json
  user = JSON.parse(request.body.read)
  users << user
  status 201
  user.to_json
end

delete '/users' do
  users.clear
  status 204
end

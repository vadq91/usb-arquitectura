require 'sinatra'
require 'json'

set :port, 4002
set :bind, 'localhost'

products = []

get '/products' do
  content_type :json
  products.to_json
end

post '/products' do
  content_type :json
  product = JSON.parse(request.body.read)
  products << product
  status 201
  product.to_json
end

delete '/products' do
  products.clear
  status 204
end

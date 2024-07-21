require 'net/http'
require 'uri'
require 'sinatra'
require 'json'

set :port, 4000
set :bind, 'localhost'
set :default_content_type, :json

USER_SERVICE = 'http://localhost:4001/users'
PRODUCT_SERVICE = 'http://localhost:4002/products'

get '/api/:service' do
  url = check_service params['service']

  http = Net::HTTP.new(url.host, url.port)
  request = Net::HTTP::Get.new(url.request_uri)
  response = http.request(request)

  status response.code
  response.body
rescue ServiceNotFoud => e
  status 401
  { message: e.message }.to_json
end

post '/api/:service' do
  url = check_service params['service']

  data = JSON.parse request.body.read

  http = Net::HTTP.new(url.host, url.port)
  request = Net::HTTP::Post.new(url.path, { 'Content-Type' => 'application/json' })
  request.body = data.to_json
  response = http.request(request)

  status response.code
  response.body
rescue ServiceNotFoud => e
  status 404
  { message: e.message }.to_json
end

def check_service(service_name)
  if service_name == 'users'
    URI.parse(USER_SERVICE)
  elsif service_name == 'products'
    URI.parse(PRODUCT_SERVICE)
  else
    status 404
    raise ServiceNotFoud.new
  end
end

class ServiceNotFoud < StandardError
  def initialize(msg="Servicio no encontrado")
    super
  end
end

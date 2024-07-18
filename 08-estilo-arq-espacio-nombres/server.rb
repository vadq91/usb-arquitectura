require 'bundler/setup'
require 'sinatra'
require 'json'

require_relative 'app/api/core/models/product'
require_relative 'app/api/core/services/product_service'
require_relative 'app/api/core/controllers/product_controller'
require_relative 'app/api/v1/endpoints/routes'

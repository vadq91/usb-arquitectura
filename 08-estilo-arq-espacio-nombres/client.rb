require 'net/http'
require 'uri'
require 'json'

def show_menu
  puts ""
  puts "Seleccione una opción:"
  puts "1. Agregar producto"
  puts "2. Listar productos"
  puts "3. Salir"
end

def create_product
  puts "Ingrese el nombre del producto"
  name = gets.chomp
  puts "Ingrese el valor del producto"
  price = gets.chomp.to_i

  url = URI.parse('http://127.0.0.1:4567/v1/products')
  http = Net::HTTP.new(url.host, url.port)
  request = Net::HTTP::Post.new(url.path, { 'Content-Type' => 'application/json' })
  request.body = { name: name, price: price }.to_json
  response = http.request(request)

  puts "Response Code: #{response.code}"
  puts "Response Body: #{response.body}"
end

def list_products
  url = URI.parse('http://127.0.0.1:4567/v1/products')
  http = Net::HTTP.new(url.host, url.port)
  request = Net::HTTP::Get.new(url.request_uri)
  response = http.request(request)

  puts "Response Code: #{response.code}"
  puts "Response Body: #{response.body}"
end

loop do
  show_menu
  opcion = gets.chomp.to_i

  case opcion
  when 1
    create_product
  when 2
    list_products
  when 3
    puts "Saliendo..."
    break
  else
    puts "Opción no válida, por favor intente de nuevo."
  end
end

puts "Programa terminado."

helpers do
  def product_controller
    puts
    if @product_controller.nil?
      @product_controller = MyApp::Controllers::ProductController.new
    end

    @product_controller
  end
end

get '/v1/products' do
  content_type :json
  status 200

  product_controller.show_products.to_json
end

post '/v1/products' do
  request.body.rewind
  data = JSON.parse request.body.read
  product_controller.create_product(data['name'], data['price'])

  content_type :json
  status 200
end

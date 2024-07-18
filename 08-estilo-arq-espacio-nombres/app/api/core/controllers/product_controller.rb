module MyApp
  module Controllers
    class ProductController
      def create_product(name, price)
        product = MyApp::Models::Product.new(name, price)
        MyApp::Services::ProductService.add_product(product.as_json)
      end

      def show_products
        MyApp::Services::ProductService.list_products
      end
    end
  end
end

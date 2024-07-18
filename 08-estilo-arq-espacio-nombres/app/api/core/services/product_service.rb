module MyApp
  module Services
    class ProductService
      @@products = []

      def self.add_product(product)
        @@products << product
      end

      def self.list_products
        @@products
      end
    end
  end
end

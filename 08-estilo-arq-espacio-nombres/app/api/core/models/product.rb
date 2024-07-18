module MyApp
  module Models
    class Product
      attr_accessor :name, :price

      def initialize(name, price)
        @name = name
        @price = price
      end

      def as_json
        { name: @name, price: @price }.to_json
      end
    end
  end
end

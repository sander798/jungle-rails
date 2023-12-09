require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do
    
    before do
      @category = Category.create(name: "cat1")
      @product = Product.new() # name: "testProduct", price: 3.99, quantity: 2, category: @category
    end

    it "Can be created using 4 data fields" do
      @product.name = "testProduct"
      @product.price = 3.99
      @product.quantity = 2
      @product.category = @category
      expect(@product.save!).to eql(true)
    end

    it "Needs a name" do
      #@product.name = "testProduct"
      @product.price = 3.99
      @product.quantity = 2
      @product.category = @category
      expect {@product.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "Needs a price" do
      @product.name = "testProduct"
      #@product.price = 3.99
      @product.quantity = 2
      @product.category = @category
      expect {@product.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "Needs a quantity" do
      @product.name = "testProduct"
      @product.price = 3.99
      #@product.quantity = 2
      @product.category = @category
      expect {@product.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "Needs a category" do
      @product.name = "testProduct"
      @product.price = 3.99
      @product.quantity = 2
      #@product.category = @category
      expect {@product.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
  
end

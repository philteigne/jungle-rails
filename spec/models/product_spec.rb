require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'saves a product with all attributes filled' do
      @category = Category.new(name: "Valid")
      expect(@product = Product.new(
        name: "Test",
        price_cents: 1299,
        quantity: 10,
        category: @category
      )).to be_valid
    end
    it 'fails to save a product with no name' do
      @category = Category.new(name: "Invalid")
      expect(@product = Product.new(
        price_cents: 1299,
        quantity: 10,
        category: @category
      )).not_to be_valid
    end
    it 'fails to save a product with no price' do
      @category = Category.new(name: "Invalid")
      expect(@product = Product.new(
        name: "Test",
        quantity: 10,
        category: @category
      )).not_to be_valid
    end
    it 'fails to save a product with no quantity' do
      @category = Category.new(name: "Invalid")
      expect(@product = Product.new(
        name: "Test",
        price_cents: 1299,
        category: @category
      )).not_to be_valid
    end
    it 'fails to save a product with no category' do
      expect(@product = Product.new(
        name: "Test",
        price_cents: 1299,
        quantity: 10,
      )).not_to be_valid
    end
  end
end

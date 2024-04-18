require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'After creation' do
    before :each do
      @category = Category.new(name: "Test")
      @category.save
      # Setup at least two products with different quantities, names, etc
      @product1 = Product.create!(
      name: 'Australian Ficus',
      description: 'This thunder from down under likes to photosynthesize and chill.',
      category: @category,
      quantity: 3,
      image: 'plante_1.jpg',
      price: 2499
      )
      @product2 = Product.create!(
      name: 'Canadian Ficus',
      description: 'This chilly fella likes to soak in the sun with a couple buds and brews.',
      category: @category,
      quantity: 4,
      image: 'plante_2.jpg',
      price: 5099
      )
      # Setup at least one product that will NOT be in the order
    end
    # pending test 1
    it 'deducts quantity from products based on their line item quantities' do
      # TODO: Implement based on hints below
      # 1. initialize order with necessary fields (see orders_controllers, schema and model definition for what is required)
      @order = Order.new(
        email: 'test@test.com',
        total_cents: @product1.price * 2,
        stripe_charge_id: 1,
      )
      # 2. build line items on @order
      @order.line_items.new(
        product: @product1,
        quantity: 2,
        item_price: @product1.price,
        total_price: @product1.price * 2
      )
      # 3. save! the order - ie raise an exception if it fails (not expected)
      @order.save!
      # 4. reload products to have their updated quantities
      @product1.reload
      @product2.reload
      # 5. use RSpec expect syntax to assert their new quantity values
      expect(@product1.quantity).to eq(1)
    end
    # pending test 2
    it 'does not deduct quantity from products that are not in the order' do
      # 1. initialize order with necessary fields (see orders_controllers, schema and model definition for what is required)
      @order = Order.new(
        email: 'test@test.com',
        total_cents: @product1.price * 2,
        stripe_charge_id: 1,
      )
      # 2. build line items on @order
      @order.line_items.new(
        product: @product1,
        quantity: 2,
        item_price: @product1.price,
        total_price: @product1.price * 2
      )
      # 3. save! the order - ie raise an exception if it fails (not expected)
      @order.save!
      # 4. reload products to have their updated quantities
      @product1.reload
      @product2.reload
      # 5. use RSpec expect syntax to assert their new quantity values
      expect(@product2.quantity).to eq(4)
    end
  end
end

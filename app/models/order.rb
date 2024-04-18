class Order < ApplicationRecord



  has_many :line_items

  monetize :total_cents, numericality: true

  validates :stripe_charge_id, presence: true

  after_create :adjust_product_quantities

  private

  def adjust_product_quantities
    line_items.each do |product|
      p "product", product.product_id
      db_product = Product.find(product.product_id)
      updated_quantity = db_product.quantity - product.quantity
      db_product.update(quantity: updated_quantity)
    end
  end

end

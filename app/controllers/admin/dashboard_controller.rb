class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: ENV['BASIC_AUTH_USERNAME'], password: ENV['BASIC_AUTH_PASSWORD']

  def show
    @product_total_count = Product.count
    @category_total_count = Category.count
  end
end

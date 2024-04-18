class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @ratings = Rating.where(product_id: params[:id])
    @rating = Rating.new
  end

  def create
    @ratings = Rating.create(rating_params)
  end

  private

  def rating_params
    params.require(:rating).permit(
      :rating,
      :description
    )
  end
end

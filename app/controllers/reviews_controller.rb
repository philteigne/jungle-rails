class ReviewsController < ApplicationController

  def create
    @reviews = Review.create(review_params)
    redirect_to products_url
  end

  private

  def review_params
    params.require(:review).permit(
      :rating,
      :description
    )
  end
end

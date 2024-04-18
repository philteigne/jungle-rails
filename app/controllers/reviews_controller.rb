class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to product_path(@review.product_id), notice: 'Review was successfully created.'
    else
      redirect_to product_path(@review.product_id), notice: 'Could not save review'
    end
  end

  private

  def review_params
    params.require(:review).permit(
      :rating,
      :description,
      :product_id,
      :users_id
    )
  end
end

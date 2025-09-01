class ReviewsController < ApplicationController
   def create
    @list = List.find(params[:list_id])
    @review = Review.new(review_params)
    @review.list = @list
    if @review.save
      redirect_to @list, notice: "Review added."
    else
      # Reuse the list show; ensure other instance vars are present
      @bookmark = Bookmark.new
      render "lists/show", status: :unprocessable_entity
    end
  end

  def destroy
    @list = List.find(params[:list_id])
    review = @list.reviews.find(params[:id])
    review.destroy
    redirect_to @list, notice: "Review removed."
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

end

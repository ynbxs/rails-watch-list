class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = @list.bookmarks.build(bookmark_params)  # associates list in one go

    if @bookmark.save
      redirect_to @list, notice: "Movie bookmarked!"
    else
      # These are needed by lists/show when re-rendering with errors
      @review = Review.new
      render "lists/show", status: :unprocessable_entity
    end
  end

  def destroy
    bookmark = Bookmark.find(params[:id])
    list = bookmark.list
    bookmark.destroy
    redirect_to list, notice: "Bookmark removed."
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end

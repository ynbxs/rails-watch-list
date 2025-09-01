class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
    @review = Review.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to @list, notice: "List create"
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path, notice: "List removed."
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

end

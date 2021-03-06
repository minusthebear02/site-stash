class BookmarksController < ApplicationController
  before_action :set_topic
  before_action :set_bookmark, only: [:edit, :update, :destroy]

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = @topic.bookmarks.build(params.require(:bookmark).permit(:url))

    if @bookmark.save
      flash[:notice] = "Bookmark was saved."
      redirect_to @topic
    else
      flash.now[:alert] = "There was an error saving the site. Please try again."
      redirect_to @topic
    end
  end

  def edit
  end

  def update

    @bookmark.assign_attributes(params.require(:bookmark).permit(:url))

    if @bookmark.save
      flash[:notice] = "Site was updated."
      redirect_to @bookmark.topic
    else
      flash.now[:alert] = "There was an error saving the site. Please try again."
      render :edit
    end
  end

  def destroy

    if @bookmark.destroy
      flash[:notice] = "\"#{@bookmark.url}\" was deleted successfully."
      redirect_to @bookmark.topic
    else
      flash.now[:alert] = "There was an error deleting the post."
      redirect_to @bookmark.topic
    end
  end

  private

  def set_topic
    @topic = Topic.find(params[:topic_id])
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end
end

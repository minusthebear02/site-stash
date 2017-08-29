class LikesController < ApplicationController

  def index
  end

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)

    authorize like

    if like.save
      redirect_to @bookmark.topic, notice: "Site was liked."
    else
      flash.now[:alert] = "There was a problem liking the site. Please try again."
      redirect_to @bookmark.topic
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.find(params[:id])

    authorize like

    if like.destroy
      redirect_to request.referrer, notice: "Site was unliked."
    else
      flash.now[:alert] = "There was a problem unliking the site. Please try again."
      redirect_to request.referrer
    end
  end
end

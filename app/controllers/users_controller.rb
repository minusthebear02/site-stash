class UsersController < ApplicationController
  def show
    @topics = current_user.topics
    @liked_bookmarks = current_user.likes.map(&:bookmark)
  end
end

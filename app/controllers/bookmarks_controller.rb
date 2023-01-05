class BookmarksController < ApplicationController
  def create
    exhibition = Exhibition.find(params[:exhibition_id])
    current_user.bookmark(exhibition)
    redirect_back fallback_location: root_path, success: "お気に入りしました"
  end

  def destroy
    exhibition = current_user.bookmarks.find(params[:id]).exhibition
    current_user.unbookmark(exhibition)
    redirect_back fallback_location: root_path, success: "お気に入り解除しました"
  end
end

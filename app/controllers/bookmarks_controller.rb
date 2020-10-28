class BookmarksController < ApplicationController

  # def index
  #   @bookmark_questions = current_user.bookmark_questions
  # end

  def create
    bookmark = current_user.bookmarks.create(question_id: params[:question_id])
    redirect_to question_path(bookmark.question_id), notice: "#{bookmark.question.user.name}さんの質問をお気に入り登録しました"
  end

  def destroy
    bookmark = current_user.bookmarks.find_by(id: params[:id]).destroy
    redirect_to question_path(bookmark.question_id), notice: "#{bookmark.question.user.name}さんの質問をお気に入り解除しました"
  end
end

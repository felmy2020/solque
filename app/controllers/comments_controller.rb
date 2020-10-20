class CommentsController < ApplicationController

  def create
    @comment = Comment.create(comment_params)
    @answer = Answer.find(@comment.answer_id)
    redirect_to question_path(@answer.question_id)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @answer = Answer.find(@comment.answer_id)
    @comment.destroy
    redirect_to question_path(@answer.question_id)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :answer_id, :user_id)
  end

end

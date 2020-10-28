class CommentsController < ApplicationController

  def create
    @comment = Comment.create(comment_params)
    @answer = Answer.find(@comment.answer_id)
    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.html { redirect_to question_path(@answer.question_id), notice: '投稿できませんでした...' }
      end
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    # binding.irb
    respond_to do |format|
      flash.now[:notice] = 'コメントの編集中'
      format.js { render :edit }
    end
  end

  def update
    @comment = Comment.find(params[:id])
    @answer = Answer.find(@comment.answer_id)
      respond_to do |format|
        if @comment.update(comment_params)
          flash.now[:notice] = 'コメントが編集されました'
          format.js { render :index }
        else
          flash.now[:notice] = 'コメントの編集に失敗しました'
          format.js { render :edit_error }
        end
      end
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

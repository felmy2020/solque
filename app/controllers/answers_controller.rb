class AnswersController < ApplicationController
  before_action :set_question, only: [:create, :destroy]

  def create
    @answer = @question.answers.new(answer_params)
    if @answer.save
      redirect_to question_path(@question), notice: '回答しました'
    else
      redirect_to question_path(@question), notice: '回答できませんでした...'
    end
  end

  def destroy
    @answer = @question.answers.find(params[:id])
    @answer.destroy
    redirect_to question_path(@question.id)
  end

  private

  def set_question
    @question = Question.find(params[:question_id])
  end

  def answer_params
    params.require(:answer).permit(:content, :question_id, :users_id,:reply_answer).merge(user_id: current_user.id, question_id: params[:question_id])
  end

end

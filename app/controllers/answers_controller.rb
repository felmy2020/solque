class AnswersController < ApplicationController
  before_action :set_question, only: [:create, :destroy]

  def create
    @answer = @question.answers.create(answer_params)
    redirect_to question_path(@question)
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

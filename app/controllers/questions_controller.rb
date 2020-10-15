class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def search
    params[:q]['content_cont_all'] = params[:q]['content_cont_all'].split(/[\p{blank}\s]+/)
    @q = Question.ransack(params[:q])
    @questions = @q.result(distinct: true)
  end

  def index
    @q = Question.ransack(params[:q])
    @questions = @q.result(distinct: true)
  end

  def show
  end

  def new
    @question = Question.new
  end

  def edit
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to @question, notice: 'タスクを登録しました'
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to @question, notice: 'タスクを編集しました。'
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_path, notice:"タスクを削除しました！"
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :content, :status)
  end

  # def search_params
  #   params.require(:q).permit!
  # end

end

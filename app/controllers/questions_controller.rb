class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :bestanswer]

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
    if user_signed_in?
      @bookmark = current_user.bookmarks.find_by(question_id: @question.id)
    end
  end

  def new
    @question = Question.new
  end

  def edit
  end

  def create
    @question = current_user.questions.build(question_params)
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

  def bestanswer
    @question = Question.find(question_params[:id])
    @question.update(question_params)
    redirect_to @question, notice: 'ベストアンサーが選べられました'
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :content, :user_id, :best_answer_id, :id)
  end

  # def search_params
  #   params.require(:q).permit!
  # end

end

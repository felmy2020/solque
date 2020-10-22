class UsersController < ApplicationController
  before_action :set_user
  before_action :authenticate_user!, only: [:show, :edit, :update]

  def show
    @questions = @user.questions
    @answers = @user.answer_questions
    @bookmarks = @user.bookmark_questions
  end
  def edit
  end
  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "プロフィールを編集しました！"
    else
      render :edit
    end
  end
  private
  def set_user
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                :password_confirmation, :icon, :icon_cache)
  end
end

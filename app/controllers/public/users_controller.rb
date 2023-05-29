class Public::UsersController < ApplicationController
  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).page(params[:page])
  end

  #フレンド一覧画面
  def friends
    @mates = current_user.matchers
    @users = User.all
    @online = User.where(is_active: "true")
    @user = User.find(params[:user_id])
    @posts = @user.posts.order(created_at: :desc).limit(1)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(current_user), notice: 'ユーザー情報の更新が完了しました。'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :image, :is_active)
  end
end

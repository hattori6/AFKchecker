class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to user_path(current_user)
    else
      render 'new'
    end
  end

  def show
  end

  def index
  end

  def edit
  end
  
  private
  
  def post_params
    params.require(:post).permit(:genre_id, :feeling_id, :start_time, :finish_time, :oneword)
  end
end

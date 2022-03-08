class PostsController < ApplicationController
  before_action :authenticate_admin!, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end

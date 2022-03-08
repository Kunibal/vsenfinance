class PostsController < ApplicationController
  def edit
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

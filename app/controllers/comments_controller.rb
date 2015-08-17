class CommentsController < ApplicationController
  def create
  end

  def index
  end

  def destroy
  end

  def update
  end

  def show
  end

  private

  def comment_params
    params
      .require(:comment)
      .permit(:commentable_type, :commentable_id, :body)
  end
end

class CommentsController < ApplicationController
  def create
    params = commentable_attrs.merge(comment_params)
    comment = Comment.new(params)

    if comment.save
      render json: comment
    else
      render(
        json: comment.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def index
    render json: commentable_parent.comments
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy!

    render json: comment
  end

  def update
    comment = Comment.find(params[:id])

    if comment.update(comment_params)
      render json: comment
    else
      render(
        json: comment.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def show
    render json: Comment.find(params[:id])
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def commentable_parent
    params.each do |name, value|
      if name == "user_id"
        return User.find(value)
      elsif name == "contact_id"
        return Contact.find(value)
      end
    end
  end

  def commentable_attrs
    { commentable_id:   commentable_parent.id,
      commentable_type: commentable_parent.class }
  end
end

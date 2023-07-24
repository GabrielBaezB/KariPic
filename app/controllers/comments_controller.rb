class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: [:show, :destroy]
  before_action :load_picture_comments, only: [:show]

  def load_picture_comments
    @picture = Picture.find(params[:picture_id])
    @comments = @picture.comments
  end
  
  def show
	  @picture = Picture.find(params[:picture_id])
	  @comments = @picture.comments
    @comment = Comment.find(params[:id])
  end
  

  def create
    @picture = Picture.find(params[:picture_id])
    @comment = @picture.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @picture, notice: "Comment was successfully created."
    else
      redirect_to @picture, alert: "Failed to create comment."
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @picture = @comment.picture

    if current_user.admin? || current_user == @comment.user
      @comment.destroy
      redirect_to @picture, notice: "Comment was successfully deleted."
    else
      redirect_to @picture, alert: "You are not authorized to delete this comment."
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end

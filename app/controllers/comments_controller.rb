class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: [:destroy]
  before_action :set_comment_approve, only: [:approve]
  before_action :authenticate_user!
  before_action :owner_rights, only: [:destroy]
  
  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.post = Post.friendly.find(params[:post_id])
    if @comment.save
      flash[:success] = 'Comment was successfully created.'
      redirect_to post_path(@comment.post_id)
    else
      render :new
    end
  end

  def destroy
    @comment.destroy
    flash[:success] = 'Comment was destroyed.'
    redirect_to @post
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def set_post
      @post = Post.friendly.find(params[:post_id])
    end

    def comment_params
      params.require(:comment).permit(:text)
    end

    def owner_rights
      unless current_user == @comment.user
        flash[:error] = 'You have no rights'
        redirect_to @post
      end
    end
end
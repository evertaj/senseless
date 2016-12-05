class UsersController < ApplicationController
  before_filter :set_user 

  def show
  end

  private
  def set_user
    @user = User.find_by_username(params[:id])
    @author_posts = Post.where(user_id: @user.id).order(created_at: :desc)
  end

end
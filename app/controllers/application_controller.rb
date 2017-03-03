class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
      root_path
  end

  def after_sign_out_path_for(resource_or_scope)
      request.referer
  end

  def like
    post = Post.friendly.find(params[:id]).id
    if current_user
      user = current_user.id
      like = Like.where(user_id: user).find_by(post_id: post)
      if like
        Like.destroy(like.id)
      else
        Like.new(post_id: post, user_id: user).save
      end
    else
      flash[:error] = 'Log in to like posts'
    end
    redirect_to root_path
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :password_confirmation, :remember_me])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:login, :username, :email, :password, :remember_me])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :password, :password_confirmation, :current_password, :city, :bio, {avatars: []}])
  end 
end

# app/controllers/sessions_controller.rb
class SessionsController < ApplicationController
    def new
    end
  
    def create
      user = User.find_by(email: params[:email])
      if user&.authenticate(params[:password])
        session[:user_id] = user.id
        flash[:notice] = 'ログインしました'
        redirect_to user_path(user)
      else
        flash.now[:alert] = 'メールアドレスまたはパスワードに誤りがあります'
        render :new
      end
    end
  
    def destroy
      session[:user_id] = nil
      flash[:notice] = 'ログアウトしました'
      redirect_to new_session_path
    end
end
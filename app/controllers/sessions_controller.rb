class SessionsController < ApplicationController

  def new

  end

  def create #cria a session apos o loggin do usuario e verifica atraves dos params, se o email exite, se sim, se a password bate com o banco
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id #seta o param :user_id com o user_id do usuario para depois ser usado na autenticação do usuario
      flash[:success] = "You have successfully logged in."
      redirect_to user_path(user)
    else
      flash.now[:danger] = "Email or password was wrong."
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil #quando loggout é clicado, seta o :user_id to nil de novo
    flash[:success] = "You have logged out."
    redirect_to root_path
  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
#por default as views de outros controllers não teriam acesso as variaveis e funções que setamos aqui.
  helper_method :current_user, :logged_in? #helper_method permite que as views tenham acesso as variaveis dessas funções especificas

  def current_user # ||= significa se o @current_user estiver setado ele não faz a busca no banco, se não ele vai ao banco e pega o usuario
    @current_user ||= User.find(session[:user_id]) if session[:user_id] #sessions[:user_id] nos salvamos o user_id nos cookies dos params
  end

  def logged_in? # checa se o current_user existe e retorna true se sim e false se não
    !!current_user
  end

  def require_user # verifica se o usuario esta logado e pode ter acesso a algumas funcionalidades
    if !logged_in?
      flash[:danger] = "You must log in to perform that action"
      redirect_to root_path
    end
  end
end

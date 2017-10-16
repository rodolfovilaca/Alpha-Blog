class WelcomeController < ApplicationController

  def home #se o usuario estiver logado o root_path redireciona para os artigos e não para o signup_path
    if logged_in?
      redirect_to articles_path
    end
  end

end

class ArticlesController < ApplicationController
  before_action :set_article, except: [:new, :create, :index]

  def index
    @articles = Article.all
  end

  def new #the new action is handled by the create action
    @article = Article.new
  end

  def create #handle the new creation
    @article = Article.new(article_param) #passando as hashes dos parametros da url para a criação da article nova
    @article.user = User.first
    if @article.save #se o save do article no banco retornar true, lança a info
      flash[:success] = 'Article was successfully created' #mensagem de sucesso
      redirect_to article_path(@article) # redireciona para article#show path passando o recor(@article)
    else
      flash[:success] = 'Article creation failed'
      redirect_to 'new' #se falhar redireciona a pagina de volta para o articles#new
    end
  end

  def show
     #vai ao banco e faz uma requisição .find(id) e faz o display na view show.html.erb
  end

  def edit #the edit action is handled by the update action
  end

  def update
    if @article.update(article_param)
      flash[:success] = 'Article was successfully edited'
      redirect_to article_path(@article)
    else
      render 'edit'
      flash[:danger] = 'Article was not edited'
    end
  end

  def destroy
    @article.destroy
    flash[:danger] = 'Article was successfully deleted'
    redirect_to articles_path
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_param
      params.require(:article).permit(:title, :descriptions) #pegando os parametros nas hashes da url
    end

end

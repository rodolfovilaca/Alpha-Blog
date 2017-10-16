class UsersController < ApplicationController

  before_action :set_user, except:[:index,:new,:create]
  before_action :require_same_user, only:[:edit, :update]

  def index
    @users = User.paginate(page: params[:page], per_page:5)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Account Successfully created, welcome to the Alpha Blog, #{@user.username}."
      session[:user_id] = @user.id
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @user.update(user_params)
      flash[:success] = "Your account was successfully updated."
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  def show
    @articles = @user.articles.paginate(page: params[:page], per_page:5)
  end

  private
    def user_params
      params.require(:user).permit(:username,:email,:password)
    end

    def set_user
      @user = User.find(params[:id])
    end

    def require_same_user #bloqueia acesso ao usuario se digitar o path na url que nao tem acesso
      if !logged_in? || current_user != @user
        flash[:danger] = 'Access Denied.'
        redirect_to root_path
      end
    end
end

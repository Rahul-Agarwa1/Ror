class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def show
    # byebug
    # set_article
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
    # set_article
  end

  def create
    # render plain: params[:article]
    @article = Article.new(article_param)
    # @article.user_id = User.first.id # or  @article.user = User.first
    @article.user = current_user
    # byebug
    if @article.save
      flash[:notice] = "Articles is created successfully"
      redirect_to article_path(@article)  #this will extract id 
    #it is same as -- articles/:id
    else
      # redirect_to article_path(@)
      render 'new'
    end
  end

  def update
    # set_article
    if @article.update(article_param)
      flash[:notice] = "Article was updated successfully."
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def destroy
    # set_article
    @article.destroy
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_param
    params.require(:article).permit(:title, :description)
  end

  def require_same_user
    if current_user != @article.user
      flash[:alert] = "You can only edit or delete your own article"
      redirect_to @article
    end
  end
  
end

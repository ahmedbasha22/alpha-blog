class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :destroy, :update, :show]

  def index
    @articles = Article.all
  end

  def new
    #article demo
    @article = Article.new
  end

  def edit
  end

  def destroy
    @article.destroy
    flash[:danger] = "The article is deleted successfully!"
    redirect_to articles_path
  end

  def create
    #render plain: params[:article].inspect     #To display what is passed via params hash
    @article = Article.new(article_params)      #White list the params first
    @article.user = User.first
    if @article.save
      flash[:success] = "The article is created successfully!"     #Stays for one redirect cycle
      redirect_to article_path(@article)     #it needs the article (/id), Show action is needed
    else
      render 'new'
    end
  end

  def update
    if @article.update(article_params)      #Similar way to build an article
      flash[:success] = "The article is updated successfully!"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def show
  end


  private
    def set_article
      @article = Article.find(params[:id])
    end
    def article_params
      params.require(:article).permit(:title, :description)
    end

end

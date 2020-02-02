class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    #article deno
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "The article is deleted successfully!"
    redirect_to articles_path
  end

  def create
    #render plain: params[:article].inspect     #To display what is passed via params hash
    @article = Article.new(article_params)      #White list the params first
    if @article.save
      flash[:notice] = "The article is created successfully!"     #Stays for one redirect cycle
      redirect_to article_path(@article)     #it needs the article (/id), Show action is needed
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)      #Similar way to build an article
      flash[:notice] = "The article is updated successfully!"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def show
    @article = Article.find(params[:id])
  end


  private
    def article_params
      params.require(:article).permit(:title, :description)
    end

end

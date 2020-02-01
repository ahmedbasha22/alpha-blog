class ArticlesController < ApplicationController
  def new
    #article deno
    @article = Article.new

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
  def show
    @article = Article.find(params[:id])
  end

  private
    def article_params
      params.require(:article).permit(:title, :description)
    end

end

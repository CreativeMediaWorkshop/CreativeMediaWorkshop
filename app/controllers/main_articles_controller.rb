class MainArticlesController < ApplicationController
  before_action :set_main_article, only: [:show, :edit, :update, :destroy]

  # GET /main_articles
  # GET /main_articles.json
  def index
    @main_articles = MainArticle.all
  end

  # GET /main_articles/1
  # GET /main_articles/1.json
  def show
  end

  # GET /main_articles/new
  def new
    @main_article = MainArticle.new
  end

  # GET /main_articles/1/edit
  def edit
  end

  # POST /main_articles
  # POST /main_articles.json
  def create
    @main_article = MainArticle.new(main_article_params)

    respond_to do |format|
      if @main_article.save
        format.html { redirect_to @main_article, notice: 'Main article was successfully created.' }
        format.json { render action: 'show', status: :created, location: @main_article }
      else
        format.html { render action: 'new' }
        format.json { render json: @main_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /main_articles/1
  # PATCH/PUT /main_articles/1.json
  def update
    respond_to do |format|
      if @main_article.update(main_article_params)
        format.html { redirect_to @main_article, notice: 'Main article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @main_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /main_articles/1
  # DELETE /main_articles/1.json
  def destroy
    @main_article.destroy
    respond_to do |format|
      format.html { redirect_to main_articles_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_main_article
      @main_article = MainArticle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def main_article_params
      params.require(:main_article).permit(:title, :subtitle, :author_id, :date, :content)
    end
end

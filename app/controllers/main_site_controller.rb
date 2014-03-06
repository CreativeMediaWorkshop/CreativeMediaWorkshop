class MainSiteController < ApplicationController
  def index
  end

  def contact
  end

  def article
    @article = Article.find(params[:id])
  end
end

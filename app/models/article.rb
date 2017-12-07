class Article < ApplicationRecord
  def news_view
    @article = Article.find(params[:id])
  end
end

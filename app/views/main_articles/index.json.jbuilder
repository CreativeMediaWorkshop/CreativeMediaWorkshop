json.array!(@main_articles) do |main_article|
  json.extract! main_article, :id, :title, :subtitle, :author_id, :date, :content
  json.url main_article_url(main_article, format: :json)
end

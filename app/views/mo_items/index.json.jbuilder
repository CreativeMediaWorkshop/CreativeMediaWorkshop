json.array!(@mo_items) do |mo_item|
  json.extract! mo_item, :id, :title, :subtitle, :price, :file, :author, :description, :type, :click_times
  json.url mo_item_url(mo_item, format: :json)
end

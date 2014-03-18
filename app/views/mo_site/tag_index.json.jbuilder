json.array! @tag_items.all do |i|
  json.text i.name
  json.weight i.count
  json.link URI.decode(mo_tag_url(i.name))
end

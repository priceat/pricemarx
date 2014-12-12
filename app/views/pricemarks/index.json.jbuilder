json.array!(@pricemarks) do |pricemark|
  json.extract! pricemark, :id, :title, :url, :tag_list
  json.url pricemark_url(pricemark, format: :json)
end
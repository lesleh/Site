json.array!(@posts) do |post|
  json.extract! post, :title, :slug, :body
  json.url post_url(post, format: :json)
end

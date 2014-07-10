json.array!(@blogs) do |blog|
  json.extract! blog, :id, :title, :user_id, :description
  json.url blog_url(blog, format: :json)
end

json.array!(@posts) do |post|
  json.extract! post, :content, :user_id, :title, :published_datetime
  json.url post_url(post, format: :json)
end
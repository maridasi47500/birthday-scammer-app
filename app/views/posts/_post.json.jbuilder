json.extract! post, :id, :user_id, :pic, :title, :content, :socialmedia_id, :created_at, :updated_at
json.url post_url(post, format: :json)

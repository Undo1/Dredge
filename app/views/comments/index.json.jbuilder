json.array!(@comments) do |comment|
  json.extract! comment, :id, :text, :user_id, :comment_id, :comment_creation_date, :post_id
  json.url comment_url(comment, format: :json)
end

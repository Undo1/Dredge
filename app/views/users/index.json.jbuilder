json.array!(@users) do |user|
  json.extract! user, :id, :user_id, :display_name
  json.url user_url(user, format: :json)
end

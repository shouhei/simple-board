json.array!(@messages) do |message|
  json.extract! message, :id, :title, :body, :signature
  json.url message_url(message, format: :json)
end

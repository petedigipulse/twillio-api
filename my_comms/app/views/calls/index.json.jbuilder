json.array!(@calls) do |call|
  json.extract! call, :id, :user
  json.url call_url(call, format: :json)
end

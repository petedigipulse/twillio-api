json.array!(@numbers) do |number|
  json.extract! number, :id, :number
  json.url number_url(number, format: :json)
end

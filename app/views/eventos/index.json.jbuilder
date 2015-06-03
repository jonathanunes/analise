json.array!(@eventos) do |evento|
  json.extract! evento, :id, :nome, :twitter
  json.url evento_url(evento, format: :json)
end

json.array!(@events) do |event|
  json.extract! event, :id, :title, :description, :theme, :date, :host, :location, :image
  json.url event_url(event, format: :json)
end

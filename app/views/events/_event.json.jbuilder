json.extract! event, :id, :title, :venue, :start, :end, :description, :created_at, :updated_at
json.url event_url(event, format: :json)

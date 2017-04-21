json.extract! event, :id, :title, :event_type_id, :venue, :start, :end, :description, :calendar_id, :created_at, :updated_at
json.url event_url(event, format: :json)

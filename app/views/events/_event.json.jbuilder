json.extract! event, :id, :title, :event_type_id, :venue, :start, :end, :calendar_id :description, :created_at, :updated_at
json.url event_url(event, format: :json)

class AddEventTypeToEventTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :event_types, :event_type, :string
  end
end

class RemoveTypeFromEventTypes < ActiveRecord::Migration[5.0]
  def change
      remove_column :event_types, :type
  end
end

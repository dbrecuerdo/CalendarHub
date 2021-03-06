class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :venue
      t.datetime :start
      t.datetime :end
      t.text :description

      t.timestamps
    end
  end
end

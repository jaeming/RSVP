class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :name
      t.text :comment

      t.timestamps null: false
    end
  end
end

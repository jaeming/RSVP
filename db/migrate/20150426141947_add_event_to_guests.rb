class AddEventToGuests < ActiveRecord::Migration
  def change
    add_column :guests, :event_id, :integer
    add_index :guests, :event_id
  end
end

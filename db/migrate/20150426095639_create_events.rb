class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :theme
      t.datetime :date
      t.string :host
      t.text :location
      t.string :image

      t.timestamps null: false
    end
  end
end

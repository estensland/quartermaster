class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :body
      t.integer :divider_id
      t.hstore :hstore
      t.integer :order
      t.boolean :active, default: true

      t.timestamps
    end
  end
end

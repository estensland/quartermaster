class CreateNotebooks < ActiveRecord::Migration
  def change
    create_table :notebooks do |t|
      t.string :name
      t.string :description
      t.string :color_hex
      t.boolean :active, default: true

      t.timestamps
    end
  end
end

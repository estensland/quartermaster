class CreateDividers < ActiveRecord::Migration
  def change
    create_table :dividers do |t|
      t.string :name
      t.string :description
      t.references :parent, :polymorphic => true
      t.boolean :active, default: true
      t.integer :display_order, default: 0

      t.timestamps
    end
  end
end

class CreateGifs < ActiveRecord::Migration
  def change
    create_table :gifs do |t|
      t.string :name
      t.string :url
      t.boolean :active, default: true

      t.timestamps
    end
  end
end

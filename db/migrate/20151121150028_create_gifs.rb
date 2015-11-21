class CreateGifs < ActiveRecord::Migration
  def change
    create_table :gifs do |t|
      t.string :name
      t.boolean :url
      t.boolean :active

      t.timestamps
    end
  end
end

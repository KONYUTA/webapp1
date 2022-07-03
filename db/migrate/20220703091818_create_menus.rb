class CreateMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :menus do |t|
      t.integer :user_id
      t.integer :genre_id
      t.text :title
      t.text :caption
      t.integer :price

      t.timestamps
    end
  end
end

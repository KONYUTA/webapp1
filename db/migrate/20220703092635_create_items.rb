class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :menu_id
      t.string :name
      t.text :caption

      t.timestamps
    end
  end
end

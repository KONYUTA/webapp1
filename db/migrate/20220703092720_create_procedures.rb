class CreateProcedures < ActiveRecord::Migration[6.1]
  def change
    create_table :procedures do |t|
      t.integer :menu_id
      t.string :title
      t.text :caption

      t.timestamps
    end
  end
end

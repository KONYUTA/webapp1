class CreateNotififations < ActiveRecord::Migration[6.1]
  def change
    create_table :notififations do |t|
      t.text :title
      t.text :body

      t.timestamps
    end
  end
end

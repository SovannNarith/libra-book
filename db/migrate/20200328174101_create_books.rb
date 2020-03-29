class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.text :description
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end

class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.references :user
      t.string :title
      t.string :author

      t.timestamps
    end
    add_index :books, :user_id
  end
end

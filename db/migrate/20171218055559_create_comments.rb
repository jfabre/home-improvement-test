class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.integer :commentable_id
      t.string :commentable_type
      t.text :body
      t.integer :user_id, null: false
      t.timestamps
    end

    add_index :comments, :user_id
    add_index :comments, [:commentable_id, :commentable_type]
  end
end

class DeviseCreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""

      ## Omniauthable
      t.string :uid

      t.timestamps null: false
    end

    add_index :users, :email, unique: true
    add_index :users, :uid,   unique: true
  end
end

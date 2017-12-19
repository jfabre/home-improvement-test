class DeviseCreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :full_name,          null: false
      t.string :email,              null: false, default: ""
      t.string :image

      ## Omniauthable
      t.string :uid
      t.string :provider
      
      t.timestamps null: false
    end

    add_index :users, :email, unique: true
    add_index :users, [:uid, :provider],   unique: true
  end
end

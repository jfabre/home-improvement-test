class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.integer :type,   default: 0 
      t.integer :status, default: 0 
    end

    add_index :projects, :type
    add_index :projects, :status
  end
end

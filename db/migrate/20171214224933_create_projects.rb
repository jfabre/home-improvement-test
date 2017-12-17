class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.integer :type,   default: 0 
      t.integer :status, default: 0
      t.decimal :estimated_effort_level, precision: 7, scale: 2
      t.decimal :actual_effort_level, precision: 7, scale: 2
      t.timestamps null: false
    end

    add_index :projects, :type
    add_index :projects, :status
    add_index :projects, :estimated_effort_level
    add_index :projects, :actual_effort_level
  end
end

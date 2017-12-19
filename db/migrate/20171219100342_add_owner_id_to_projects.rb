class AddOwnerIdToProjects < ActiveRecord::Migration[5.1]
  change_table :projects do |t|
    t.references :owner, index: true
  end
end

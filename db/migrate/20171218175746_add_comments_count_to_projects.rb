class AddCommentsCountToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :comments_count, :integer, default: 0
  end
end

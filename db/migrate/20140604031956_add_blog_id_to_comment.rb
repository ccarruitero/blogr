class AddBlogIdToComment < ActiveRecord::Migration
  def change
    add_column :comments, :blog_id, :integer
    add_index :comments, :blog_id
  end
end

class AddCommentableTypeToComments < ActiveRecord::Migration
  def change
    add_column :comments, :commentable_type, :string
    rename_column :comments, :blog_id, :commentable_id
  end
end

class RemoveCommentableIdFromComment < ActiveRecord::Migration
  def change
    remove_column :comments, :commentable_id, :integer
  end
end

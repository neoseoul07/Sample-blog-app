class AddCommentIdToBlog < ActiveRecord::Migration
  def change
    add_column :blogs, :comment_id, :integer
  end
end

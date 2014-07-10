class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title
      t.integer :user_id
      t.text :description
      t.timestamps
    end
  end
end

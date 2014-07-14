class Comment < ActiveRecord::Base
	belongs_to :blog
	validates :body, presence: { message: "Comment content cannot be empty"}
end

class Comment < ActiveRecord::Base
	belongs_to :blog
	validates :body, presence: true
end

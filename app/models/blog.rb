class Blog < ActiveRecord::Base
	belongs_to :user
	has_many :comments, dependent: :destroy
	validates :title, presence: true,
                    length: { maximum: 10 }
    validates :description, presence: true,
                    length: { minimum: 10 }
end

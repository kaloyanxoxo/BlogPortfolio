class Category < ApplicationRecord
	attr_accessor :title, :category_id
	validates :title, presence: true
	
	has_many :posts
end

class Post < ApplicationRecord
	belongs_to :user
	belongs_to :category
	validates :title, presence: true, uniqueness: true, length: { minimum: 10, maximum: 100}
	validates :content, presence: true, uniqueness: true, length: { minimum: 30, maximum: 500}
	validates :user_id, presence: true
	validates :category_id, presence: true
end

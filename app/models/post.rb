class Post < ApplicationRecord
	belongs_to :user
	validates :title, presence: true, uniqueness: true, length: { minimum: 10, maximum: 100}
	validates :content, presence: true, uniqueness: true, length: { minimum: 50, maximum: 500}
	validates :user_id, presence: true
end

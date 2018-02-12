class Post < ApplicationRecord
	validates :title, presence: true, length: { minimum: 10, maximum: 60}
	validates :content, presence: true, length: { minimum: 100, maximum: 500}
end

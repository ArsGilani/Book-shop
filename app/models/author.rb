class Author < ActiveRecord::Base
	validates :title, presence: true,
		length: { minimum: 1, maximum: 250 }
	validates :description, presence: true
	
	has_many :books
end

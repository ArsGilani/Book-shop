class Book < ActiveRecord::Base
	validates :title, presence: true,
		length: { minimum: 1, maximum: 250 }
	validates :price, presence: true,
		numericality: { greater_than: 0 }

		belongs_to :genre
		
		belongs_to :author

		has_many :comments	
end

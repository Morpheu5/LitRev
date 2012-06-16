class Entry < ActiveRecord::Base
	attr_accessible :title, :review_date, :review, :rating
	
	validates :title, :presence => true
	
	has_and_belongs_to_many :tags
	has_and_belongs_to_many :authors
end

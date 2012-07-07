class Entry < ActiveRecord::Base
	attr_accessible :title, :review_date, :review, :rating, :tag_ids
	
	validates :title, :presence => true
	
	has_and_belongs_to_many :tags
	has_and_belongs_to_many :authors
	
	def tags_list
		self.tags.collect do |tag|
			tag.name
		end.join(', ')
	end
end

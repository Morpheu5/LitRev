class Tag < ActiveRecord::Base
	attr_accessible :name
	
	validates :name, :presence => true
	
	has_and_belongs_to_many :entries
end

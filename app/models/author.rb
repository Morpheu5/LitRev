class Author < ActiveRecord::Base
	attr_accessible :name, :surname, :notes
	
	validates :name, :presence => true
	validates :surname, :presence => true
	
	has_and_belongs_to_many :entries
end

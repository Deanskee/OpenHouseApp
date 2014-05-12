class VisitorLocation
	include Mongoid::Document
	belongs_to :location
	belongs_to :visitor 
end


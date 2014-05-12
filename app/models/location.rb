class Location
  include Mongoid::Document
  field :address, type: String
  field :zip_code, type: Integer
  field :owner, type: String
  has_many :visitor_locations
  belongs_to :agent
end

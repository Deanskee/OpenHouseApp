class Visitor
  include Mongoid::Document
  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  has_many :visitor_locations
end


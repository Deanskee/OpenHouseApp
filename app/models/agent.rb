class Agent < User
  has_many :locations
  belongs_to :user
end
# single model inheritance 
# same database but a different type. When a user creates an agent 
# both users just different 'types' of users
# in theory can add more types and
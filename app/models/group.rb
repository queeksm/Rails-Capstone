class Group < ApplicationRecord  
  has_many :transaction_groups
  has_many :bdrafts, through: :transaction_groups 
  belongs_to :user
end

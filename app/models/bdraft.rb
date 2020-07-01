class Bdraft < ApplicationRecord  
  has_many :transaction_groups
  has_many :groups, through: :transaction_groups
  belongs_to :user
end

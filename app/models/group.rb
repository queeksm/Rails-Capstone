class Group < ApplicationRecord
  has_many :transaction_group
  has_many :transactions, through: :transaction_group
  belongs_to :user

end

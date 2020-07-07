class Bdraft < ApplicationRecord
  has_many :transaction_groups
  has_many :groups, through: :transaction_groups
  belongs_to :user
  validates :name, uniqueness: true, presence: true
  validates :amount, numericality: { other_than: 0 }
end

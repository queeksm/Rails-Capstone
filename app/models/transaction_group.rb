class TransactionGroup < ApplicationRecord
  belongs_to :group
  belongs_to :bdraft
end

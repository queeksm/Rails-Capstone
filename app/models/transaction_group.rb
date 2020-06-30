class TransactionGroup < ApplicationRecord
  belongs_to :group, class_name: "group", foreign_key: "group_id"
  belongs_to :transaction, class_name: "transaction", foreign_key: "transaction_id"
end

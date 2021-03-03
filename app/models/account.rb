class Account < ApplicationRecord
  belongs_to :user
  has_one :account_history
  belongs_to :account_type
end

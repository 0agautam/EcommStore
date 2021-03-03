class AccountType < ApplicationRecord
  has_many :accounts

  #validation
  validates :name, inclusion: {in: %w(free basic standard premium), message:"%{value} is not a valid account"}
end

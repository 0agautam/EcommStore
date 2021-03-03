class User < ApplicationRecord
  has_one :cart
  has_one :account
  has_one :account_history, through: :account
  has_many :orders

#validations
  validates :name, presence: true, format: {with: /\A[A-Za-z]+\z/,message:"should contain alphabets only"}
  
  validates :address, presence: true

  validates :terms_of_service, acceptance: {message:'Must be abided strictly',accept:['true','yes']}
  validates :eula, acceptance: {message:'Must be abided', accept:['trusted','accepted']}

  #association validaiton
  validates_associated :orders
  
  validates :email, presence: true, confirmation: {case_sensitive: false}
  validates :email_confirmation, presence: true

  validates :pincode, exclusion: {in: %w(100000 200000 300000),message:"%{value} is excluded"}, length: {is: 6},format: {with: /\A[0-9]+\z/, message:"only numbers allowed"}
end


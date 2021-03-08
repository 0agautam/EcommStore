class MyValidator < ActiveModel::Validator
  def validate(record)
    unless record.name =~/\A[A-Z][a-z]+\z/
      record.errors.add :base, "Name should contain only letters starting with Upper case"
    end
  end
end

class EmailValidator < ActiveModel::Validator
  def validate(record)
    unless record.email =~ /\A([^@\s]+)@((?:[a-zA-Z0-9]+\.)+[a-z]{2,})\z/i
      record.errors.add :base, "Enter a valid email"
    end
  end
end

class User < ApplicationRecord
  has_one :cart
  has_one :account
  has_one :account_history, through: :account
  has_many :orders, dependent: :destroy

  has_many :pictures, as: :imageable
  
  after_touch :log_when_order_is_touched

#validations
  #validates :name, presence: true, format: {with: /\A[A-Za-z]+\z/,message:"should contain alphabets only"}
  
  validates :address, presence: true

  validates :terms_of_service, acceptance: {message:'Must be abided strictly',accept:['true','yes']}
  validates :eula, acceptance: {message:'Must be abided', accept:['trusted','accepted']}

  #association validaiton
  validates_associated :orders
  
  validates :email, presence: true, confirmation: {case_sensitive: false}, uniqueness: {case_sensitive: false},email: true
  validates :email_confirmation, presence: true

  validates :pincode, exclusion: {in: %w(100000 200000 300000),message:"%{value} is excluded"}, length: {is: 6},format: {with: /\A[0-9]+\z/, message:"only numbers allowed"}
  
  validates_with MyValidator
  validates_with EmailValidator

  private

    def log_when_order_is_touched
      puts "An order/user is touched for user #{self.orders.ids}"
    end

end


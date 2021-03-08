class Order < ApplicationRecord
  belongs_to :user, touch: true
  after_destroy :log_destroy_action
  
  before_save :normalize_card_number, 
    if: Proc.new { |order| order.paid_with_card? }
  
  private

    after_touch do 
      puts "An order is touched"
    end

    def log_destroy_action
      puts "Order destroyed"
    end
end

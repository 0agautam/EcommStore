class Order < ApplicationRecord
  belongs_to :user, touch: true
  after_destroy :log_destroy_action

  private

    after_touch do 
      puts "An order is touched"
    end

    def log_destroy_action
      puts "Order destroyed"
    end
end

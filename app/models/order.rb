class Order < ApplicationRecord
  belongs_to :user, touch: true

  private

    after_touch do 
      puts "An order is touched"
    end
end

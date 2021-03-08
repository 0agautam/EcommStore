class Person < ApplicationRecord
  
  validates_each :name,:address do |record, attr, value| 
    record.errors.add(attr, "must start with letter") if value =~ /\A[[:digit:]]/  
  end

  validates :address,:name, presence:true
  before_validation :ensure_you_have_a_value
  
  before_validation :normalize_name, on: :create
  #after_validation :set_address, on: [:create, :update]


  private
    def ensure_you_have_a_value
      myid = Person.last.id
      myid +=1
      if name.nil?
        myid = myid.to_s  
        print "NameError"
        self.name = ("person").concat(myid)
      end
        
      if address.nil?
        myid = myid.to_s
        print "Address Error"
        self.address = ("address").concat(myid)
      end
    end
    
    def normalize_name
      self.name.capitalize!
    end

    # def set_address 
    #   self.address = LocationService.query(self)
    # end
    # before_create do
    #   self.name.capitalize!
    #   self.address.capitalize!
    # end

    after_initialize do
      puts "You have  initialized an object!"
    end

    after_find do
      puts "You have found an object"
    end

    after_touch do 
      puts "Ouch!!! You touched an object"
    end
end

# class GoodnessValidator < ActiveModel::Validator
#   def validate(record)
#     if options[:fields].any? {|field| record.send(field) == "Evil"}
#       record.errors.add :base, "You are an evil person"
#     end
#   end
# end

# class Person < ApplicationRecord
#   validates_with GoodnessValidator, fields: [:name,:email]
# end

# class Person < ApplicationRecord
#   validate do |person|
#     GoodnessValidator.new(person).validate
#   end
# end

# class GoodnessValidator
#   def initialize(person)
#     @person = person
#   end

#   def validate
#     if some_complex_condition_involving_ivars_and_private_methods?
#       @person.errors.add :base, "This person is evil"
#     end
#   end

#   # ...
# end

class Person < ApplicationRecord
  validates_each :name,:address do |record, attr, value| 
    record.errors.add(attr, "must start with Upper Case") if value =~ /\A[[:lower:]]/  
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

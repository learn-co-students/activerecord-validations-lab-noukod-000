class Author < ActiveRecord::Base
  validates :name, phone_number: true
end
Author.create(name: "John Doe").valid? # => true
Author.create(name: nil).valid?

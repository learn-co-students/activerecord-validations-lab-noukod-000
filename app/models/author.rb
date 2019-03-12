class Author < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :phone_number, format: { with: /\A(\d)+\z/}, length: {is: 10}
end

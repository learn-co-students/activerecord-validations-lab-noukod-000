class Post < ActiveRecord::Base
  validates :title,title:true
  validates :content,length:{ minimum: 10}
  validates :summary,length:{ maximum: 25}
  validates :category,inclusion:{ in:%w(Fiction Non-Fiction)}
end

class TitleValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless !value.nil? && value.scan(/Won't Believe|Secret|To[number]|Guess/)!=[]
      record.errors[attribute] << (options[:message] || "is not a valid one")
    end
  end
end

class Post < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates(:content, { :length => { :minimum => 250 } })
  validates(:summary, { :length => { :maximum => 250 } })
  validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }
  validate :clickbait

  def clickbait
    errors.add(:title, "is not clickbait-y") unless ["Won't Believe", "Secret", "Top [number]", "Guess"].any? do |e|
      title.include?(e) if title
    end
  end
end

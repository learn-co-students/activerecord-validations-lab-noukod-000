class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, presence: true, length: { minimum: 250 }
  validates :summary, presence: true, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "%{value} must be either Fiction or Non-Fiction" }
  validate :click_bait

  def click_bait
    click_bait_array = [
      "Won't Believe", "Secret", "Top [number]", "Guess",
    ]

    if title.present?
      has_click_bait = false

      click_bait_array.each do |bait|
        if title.downcase.include? bait.downcase
          has_click_bait = true
        end
      end

      if !has_click_bait
        errors.add(:title, "ooo! {value} is not click baity enough...")
      end
    end
 end
end

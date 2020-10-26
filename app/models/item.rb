class Item < ApplicationRecord

  # These are methods for Item we can use in the console:
  def completed?
    !completed_at.blank?
  end
end

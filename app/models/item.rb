class Item < ApplicationRecord

  # Toggle completed
  def completed?
    !completed_at.blank?
  end
end

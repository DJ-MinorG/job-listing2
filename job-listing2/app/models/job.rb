class Job < ApplicationRecord
  validates :title, presence: true
  validates :wage_upper_bound, presence: true
  validates :wage_lower_bound, presence: true
  validates :wage_lower_bound, numericality: { greater_than: 0}

  def is_hidden!
    if self.is_hidden
      self.is_hidden = false
      self.save
    else
      self.is_hidden = true
      self.save
    end

  end
end

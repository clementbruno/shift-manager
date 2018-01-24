class Shift < ApplicationRecord
  belongs_to :worker

  validates :date, presence: true, uniqueness: true

  #Check if my_related_model is the right keyword
  def start_time
      self.my_related_model.date
  end
end

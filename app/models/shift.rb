class Shift < ApplicationRecord
  belongs_to :worker

  validates :date, presence: true, uniqueness: true


  def start_time
        self.date ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
  end
end

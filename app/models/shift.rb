class Shift < ApplicationRecord
  belongs_to :worker

  validates :date, presence: true, uniqueness: true
end

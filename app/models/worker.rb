class Worker < ApplicationRecord
  has_many :shifts

  validates :status,
    :inclusion  => { :in => [ 'Medic', 'Interne', 'Interim' ],
    :message    => "%{value} is not a valid status" }
  validates :name, presence: true
end

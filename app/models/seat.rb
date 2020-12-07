class Seat < ApplicationRecord
  #enum status: %i[empty window aisle middle]
  belongs_to :seat_group
  scope :free_seats, -> { where(status: 0).order(:cat) }

  def self.fill(total_seat)
    free_seats.limit(total_seat).update(status: 1)
  end
end

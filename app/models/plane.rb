class Plane < ApplicationRecord
  has_many :seat_groups
  has_many :seats, through: :seat_groups
  accepts_nested_attributes_for :seat_groups, allow_destroy: true, reject_if: :all_blank
  before_create :add_chain_number
  after_create :create_seats

  private

  def add_chain_number
    self.seat_groups.each_with_index do |seat_group, index|
      seat_group[:chain_number] = index
    end
    self.seat_groups.create_seats
  end

  def create_seats
    seat_groups.create_seats
  end

end

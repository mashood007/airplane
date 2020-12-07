
class SeatGroup < ApplicationRecord
  has_many :seats

  def seat_info(col, row)
    seats.find_by(col_number: col, row_number: row)
  end
  class << self
    def create_seats
      @total = all.size - 1
      all.each_with_index do |group, index|
        @index = index
        @group = group
        rows
      end
    end

    def rows
      (0..@group.total_rows - 1).each do |row|
        cols(row)
      end
    end

    def cols(row)
      (0..@group.total_columns - 1).each do |col|
        type = if window_seat?(col)
                 1
               elsif aisle_seat?(col)
                 2
               else
                 3
               end
        @group.seats.create(row_number: row, col_number: col, cat: type, status: 0)
      end
    end

    def window_seat?(col)
      (@index.zero? && col.zero?) || (@index == @total && col == @group.total_columns - 1)
    end

    def aisle_seat?(col)
      col.zero? || col == @group.total_columns - 1
    end
  end
end

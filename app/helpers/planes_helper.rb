module PlanesHelper
#group.total_columns - 1
  def seat_type(col, total_columns, index, total)
    if (index.zero? && col.zero?) || (index == total && col == total_columns )
        "success"
      elsif col.zero? || col == total_columns
        "info"
      else
        "danger"
      end
    end
end

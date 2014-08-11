class Counter
  def initialize(cols, rows)
    @col_count = -1
    @row_count = 0
    @col_max = cols - 1
    @row_max = rows - 1
  end

  def count
    if @col_count >= @col_max
      @row_count += 1
      @col_count = 0
      {row: @row_count, col: @col_count}
    else
      @col_count += 1
      {row: @row_count, col: @col_count}
    end
  end
end

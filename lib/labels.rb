require 'csv'
require 'prawn'

class Labels

  def initialize(opts, counter)
    @margins = {
      left_margin: opts[:left_margin],
      right_margin: opts[:right_margin],
      top_margin: opts[:top_margin],
      bottom_margin: opts[:bottom_margin]
    }
    @path = opts[:path]
    @name = File.basename(@path, '.csv')
      .gsub(' ', '')
      .gsub('-', '_')
      .downcase
    @counter = counter
    @dest = opts[:dest]
    @cols = opts[:cols]
    @rows = opts[:rows]
    @font = opts[:font]
  end

  def create
    cols = @cols
    rows = @rows
    font_path = @font
    labels = CSV.read(@path)
    counter = @counter.new(cols, rows)

    Prawn::Document.generate("#{@dest}/label_#{@name}.pdf", @margins) do
      define_grid(columns: cols, rows: rows, row_gutter: 0, column_gutter: 10)
      font font_path
      font_size 10
      labels.each do |l|
        counts = counter.count
        grid(counts[:row], counts[:col]).bounding_box do
          bounding_box([20, 60], :width => 150) do
            l.each do |line|
              text line
            end
          end
        end
      end
    end
  end

end



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
    @name =  File.basename(@path, '.csv')
      .gsub(' ', '')
      .gsub('-', '_')
      .downcase if @path
    @dest = opts[:dest]
    @cols = opts[:cols]
    @rows = opts[:rows]
    @font = opts[:font]
    @single = opts[:single] || false
    @counter = counter.new(@cols, @rows)
    @pdf = create_doc()
  end


  def create
    if @single
      @name = "single"
      label = @single
      30.times do
        counts = @counter.count
        create_label(label, counts)
      end
    else
      labels = CSV.read(@path)
      labels.each do |l|
        counts = @counter.count
        create_label(l, counts)
      end
    end
    @pdf.render_file("#{@dest}/label_#{@name}.pdf")
  end

  private
  def create_doc
    pdf = Prawn::Document.new
    pdf.define_grid(columns: @cols, rows: @rows, row_gutter: 0, column_gutter: 10)
    pdf.font @font
    pdf.font_size 10
    pdf
  end

  def create_label(data, counts)
    @pdf.grid(counts[:row], counts[:col]).bounding_box do
      @pdf.bounding_box([20, 60], :width => 150) do
        @pdf.text data.join("\n").upcase
      end
    end
  end

end



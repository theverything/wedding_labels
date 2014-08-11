require_relative './lib/labels'
require_relative './lib/counter'

Dir.glob('./csv/people/*.csv').each do |file|
  opts = {
    cols: 3,
    rows: 10,
    left_margin: 13.25,
    right_margin: 13.25,
    top_margin: 35.25,
    bottom_margin: 35.25,
    path: file,
    dest: './labels',
    font: "#{Dir.pwd}/fonts/brandonlight.ttf"
  }
  labels = Labels.new(opts, Counter)
  labels.create
end

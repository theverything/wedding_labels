require_relative './lib/labels'
require_relative './lib/counter'

# # guests
# Dir.glob('./csv/guests/*.csv').each do |file|
#   opts = {
#     cols: 3,
#     rows: 10,
#     left_margin: 13.25,
#     right_margin: 13.25,
#     top_margin: 35.25,
#     bottom_margin: 35.25,
#     path: file,
#     dest: './labels',
#     font: "#{Dir.pwd}/fonts/brandonmed.ttf"
#   }
#   labels = Labels.new(opts, Counter)
#   labels.create
# end
# single
opts = {
  cols: 3,
  rows: 10,
  left_margin: 13.25,
  right_margin: 13.25,
  top_margin: 35.25,
  bottom_margin: 35.25,
  dest: './labels',
  font: "#{Dir.pwd}/fonts/brandonmed.ttf",
  single: ["Kat Park & Jeff Horn", "311 Centinary Dr", "Walnut, CA 91789"]
}
labels = Labels.new(opts, Counter)
labels.create

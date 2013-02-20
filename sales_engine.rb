require "bigdecimal"
require "./lib/parser"
require "./lib/merchant"
require "./lib/item"
require "./lib/transaction"
require "./lib/customer"
require "./lib/invoice"
require "./lib/invoice_item"

Parser.new

puts Item.most_items(20)

puts Item.find_by_id("227").quantity
puts Item.find_by_id("2174").quantity
puts Item.find_by_id("2175").quantity
puts Item.find_by_id("104").quantity
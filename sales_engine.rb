require "bigdecimal"
require "./lib/parser"
require "./lib/merchant"
require "./lib/item"
require "./lib/transaction"
require "./lib/customer"
require "./lib/invoice"
require "./lib/invoice_item"

Parser.new

# puts Item.most_revenue(10)
# puts ""
puts Item.find_by_id("227").revenue
puts Item.find_by_id("2174").revenue
puts Item.find_by_id("1119").revenue
require "./lib/parser"
require "./lib/merchant"
require "./lib/item"
require "./lib/transaction"
require "./lib/customer"
require "./lib/invoice"
require "./lib/invoice_item"

Parser.new

merchant = Merchant.find_by_id("26") 

puts merchant.revenue("2012-03-25 09:54:09 UTC")
puts merchant.revenue
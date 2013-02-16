require "./lib/parser"
require "./lib/merchant"
require "./lib/item"
require "./lib/transaction"
require "./lib/customer"
require "./lib/invoice"

Parser.new

# merchant = Merchant.find_by_id("3")

# puts merchant.items
# puts merchant.invoices
# puts ""
# puts "Merchant: #{merchant}"
# puts "Number of Items: #{merchant.items.count}"
# puts "Number of Invoices: #{merchant.invoices.count}"
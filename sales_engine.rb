require "./lib/parser"
require "./lib/merchant"
require "./lib/item"
require "./lib/transaction"
require "./lib/customer"
require "./lib/invoice"
require "./lib/invoice_item"

Parser.new

# invoice = Invoice.find_by_id("12")
# puts invoice.transactions

# puts "Invoice: #{invoice}"
# puts "Customer: #{invoice.customer}"
# puts "Number of transactions: #{invoice.transactions.count}"
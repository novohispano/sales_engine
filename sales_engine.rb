require "./lib/parser"
require "./lib/merchant"
require "./lib/item"
require "./lib/transaction"
require "./lib/customer"
require "./lib/invoice"

Parser.new

# invoice = Invoice.find_by_id("12")
# puts invoice.transactions

# puts "Invoice: #{invoice}"
# puts "Customer: #{invoice.customer}"
# puts "Number of transactions: #{invoice.transactions.count}"

transaction = Transaction.find_by_id("11")
puts transaction.invoice
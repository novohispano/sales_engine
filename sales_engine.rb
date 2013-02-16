require "./lib/parser"
require "./lib/merchant"
require "./lib/item"
require "./lib/transaction"
require "./lib/customer"
require "./lib/invoice"

Parser.new

invoice = Invoice.find_by_id("12")

puts invoice.transactions

puts "Invoice: #{invoice}"
puts "Customer: #{invoice.customer}"
puts "Number of transactions: #{invoice.transactions.count}"

# puts merchant.items
# puts merchant.invoices
# puts ""
# puts "Merchant: #{merchant}"
# puts "Number of Items: #{merchant.items.count}"
# puts "Number of Invoices: #{merchant.invoices.count}"
require "./lib/parser"
require "./lib/merchant"
require "./lib/item"
require "./lib/transaction"
require "./lib/customer"
require "./lib/invoice"
require "./lib/invoice_item"

Parser.new

invoice = Invoice.find_by_id("8")
puts invoice.transactions
puts ""
puts invoice.invoice_items
puts ""
puts invoice.items.inspect

puts "Invoice: #{invoice}"
puts "Customer: #{invoice.customer}"
puts "Number of transactions: #{invoice.transactions.count}"
puts "Number of invoice items: #{invoice.invoice_items.count}"
puts "Number of items: #{invoice.items.count}"
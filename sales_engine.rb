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
# puts invoice.invoice_items

# puts "Invoice: #{invoice}"
# puts "Customer: #{invoice.customer}"
# puts "Number of transactions: #{invoice.transactions.count}"
# puts "Number of invoice items: #{invoice.invoice_items.count}"

item = Item.find_by_id("2")

puts item.invoice_items

puts "Item: #{item}"
puts "Number of invoice items: #{item.invoice_items.count}"
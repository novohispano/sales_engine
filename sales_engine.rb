require "./lib/parser"
require "./lib/merchant"
require "./lib/item"
require "./lib/transaction"
require "./lib/customer"
require "./lib/invoice"
require "./lib/invoice_item"

Parser.new

customer = Customer.find_by_id("25")

puts customer.invoices
puts ""
puts customer.transactions
puts ""
puts customer.transactions.count
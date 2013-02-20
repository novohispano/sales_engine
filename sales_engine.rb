require "./lib/parser"
require "./lib/merchant"
require "./lib/item"
require "./lib/transaction"
require "./lib/customer"
require "./lib/invoice"
require "./lib/invoice_item"

Parser.new

customer = Customer.find_by_id("3")

puts customer.invoices
puts ""
puts customer.invoices.count
puts ""
puts customer.successful_invoices
puts ""
puts customer.successful_invoices.count
puts ""
puts customer.merchants
puts ""
puts customer.favorite_merchant
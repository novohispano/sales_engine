require "bigdecimal"
require "./lib/parser"
require "./lib/merchant"
require "./lib/item"
require "./lib/transaction"
require "./lib/customer"
require "./lib/invoice"
require "./lib/invoice_item"

class SalesEngine
  def self.startup
    Parser.new
  end
end

SalesEngine.startup

merchant = Merchant.find_by_id("26")

puts merchant.revenue
puts merchant.revenue("2012-03-25 09:54:09 UTC")
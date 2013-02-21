require "bigdecimal"

require "sales_engine/parser"
require "sales_engine/merchant"
require "sales_engine/item"
require "sales_engine/transaction"
require "sales_engine/customer"
require "sales_engine/invoice"
require "sales_engine/invoice_item"

module SalesEngine
  def self.startup
    Parser.new
  end
end

# SalesEngine.startup

# merchant = Merchant.find_by_id("26")

# puts merchant.revenue
# puts merchant.revenue("2012-03-25 09:54:09 UTC")
# puts merchant.revenue("2012-03-25")
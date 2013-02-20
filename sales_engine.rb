require "bigdecimal"
require "./lib/parser"
require "./lib/merchant"
require "./lib/item"
require "./lib/transaction"
require "./lib/customer"
require "./lib/invoice"
require "./lib/invoice_item"

class SalesEngine
  def startup
    Parser.new
  end
end
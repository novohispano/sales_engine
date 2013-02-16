require "csv"

class Parser
  def initialize
    customers_file = CSV.open './data/customers.csv', headers: true
    merchants_file = CSV.open './data/merchants.csv', headers: true
    invoices_file = CSV.open './data/invoices.csv', headers: true
    invoice_items_file = CSV.open './data/invoice_items.csv', headers: true
    transactions_file = CSV.open './data/transactions.csv', headers: true
    items_file = CSV.open './data/items.csv', headers: true

    Customer.build_data(customers_file)
    Merchant.build_data(merchants_file)
    Invoice.build_data(invoices_file)
    InvoiceItem.build_data(invoice_items_file)
    Transaction.build_data(transactions_file)
    Item.build_data(items_file)
  end
end
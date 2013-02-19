class Invoice
  attr_reader :id,
              :customer_id,
              :merchant_id,
              :status,
              :created_at,
              :updated_at

  def initialize(data)
    @id = data["id"]
    @customer_id = data["customer_id"]
    @merchant_id= data ["merchant_id"]
    @status = data["status"]
    @created_at = data["created_at"]
    @updated_at = data["updated_at"]
  end

  def self.build_data(contents)
    @invoices = contents.collect { |row| Invoice.new(row) }
  end

  def to_s
    "#{id} #{customer_id} #{merchant_id} #{status}"
  end

  def self.random
    @invoices.sample
  end

  def self.invoices
    @invoices
  end

  def self.find_by_id(id)
    @invoices.find { |invoice| invoice.id == id } 
  end

  def self.find_by_customer_id(customer_id)
    @invoices.find { |invoice| invoice.customer_id == customer_id }
  end

  def self.find_by_merchant_id(merchant_id)
    @invoices.find { |invoice| invoice.merchant_id == merchant_id }
  end

  def self.find_by_status(status)
    @invoices.find { |invoice| invoice.status == status }
  end

  def self.find_by_created_at(created_at)
    @invoices.find { |invoice| invoice.created_at == created_at }
  end

  def self.find_by_updated_at(updated_at)
    @invoices.find { |invoice| invoice.updated_at == updated_at }
  end

  def self.find_all_by_id(id)
    @invoices.select { |invoice| invoice.id == id }
  end

  def self.find_all_by_customer_id(customer_id)
    @invoices.select { |invoice| invoice.customer_id == customer_id }
  end  

  def self.find_all_by_merchant_id(merchant_id)
    @invoices.select { |invoice| invoice.merchant_id == merchant_id }
  end

  def self.find_all_by_status(status)
    @invoices.select { |invoice| invoice.status == status }
  end

  def self.find_all_by_created_at(created_at)
    @invoices.select { |invoice| invoice.created_at == created_at }
  end

  def self.find_all_by_updated_at(updated_at)
    @invoices.select { |invoice| invoice.updated_at == updated_at }
  end

  def transactions
    Transaction.find_all_by_invoice_id(id)
  end

  def invoice_items
    InvoiceItem.find_all_by_invoice_id(id)
  end

  def items
    InvoiceItem.find_all_by_invoice_id(id).collect do |invoice_item|
      invoice_item.item
    end
  end

  def customer
    Customer.find_by_id(customer_id)
  end

  def invoice_revenue
    invoice_items.reduce(0) do |invoice_revenue, invoice_item|
      invoice_revenue + invoice_item.subtotal
    end
  end

  def successful?
    Transaction.find_all_by_invoice_id(id).any? do |transaction| 
      transaction.result == "success"
    end
  end
end
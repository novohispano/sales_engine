class Merchant
  attr_reader :id,
              :name,
              :created_at,
              :updated_at

  def initialize(data)
    @id = data["id"]
    @name = data["name"]
    @created_at = data["created_at"]
    @updated_at = data["updated_at"]
  end

  def self.build_data(contents)
    @merchants = contents.collect { |row| Merchant.new(row) }
  end

  def self.merchants
    @merchants
  end

  def to_s
    "#{id}:#{name}"
  end

  def self.random
    @merchants.sample
  end

  def self.find_by_id(id)
    @merchants.find { |merchant| merchant.id == id }
  end

  def self.find_by_name(name)
    @merchants.find { |merchant| merchant.name == name }
  end

  def self.find_by_created_at(created_at)
    @merchants.find { |merchant| merchant.created_at == created_at }
  end

  def self.find_by_updated_at(updated_at)
    @merchants.find { |merchant| merchant.updated_at == updated_at }
  end

  def self.find_all_by_id(id)
    @merchants.find_all { |merchant| merchant.id == id }
  end

  def self.find_all_by_name(name)
    @merchants.find_all { |merchant| merchant.name == name }
  end

  def self.find_all_by_created_at(created_at)
    @merchants.find_all { |merchant| merchant.created_at == created_at }
  end

  def self.find_all_by_updated_at(updated_at)
    @merchants.find_all { |merchant| merchant.updated_at == updated_at }
  end

  def items
    Item.find_all_by_merchant_id(id)
  end

  def invoices
    Invoice.find_all_by_merchant_id(id)
  end

  def successful_invoices
    invoices.select { |invoice| invoice.successful? == true }
  end

  def quantity
    successful_invoices.reduce(0) do |quantity, invoice|
      quantity + invoice.invoice_quantity
    end
  end

  def revenue
    successful_invoices.reduce(0) do |revenue, invoice|
      revenue + invoice.invoice_revenue
    end
  end

  def customers
    successful_invoices.collect do |invoice|
      invoice.customer
    end
  end

  def favorite_customer
    customers.group_by do |customer| 
      customer
    end.max_by {|customer, customer_count| customer_count.size }.first
  end

  def self.most_items(number)
    merchants_quantity = {}
    @merchants.each do |merchant|
      merchants_quantity[merchant] = merchant.quantity
    end
    merchants_quantity.sort_by { |merchant, quantity| quantity }.reverse[0,number]
  end

  def self.most_revenue(number)
    merchants_revenue = {}
    @merchants.each do |merchant|
      merchants_revenue[merchant] = merchant.revenue
    end
    merchants_revenue.sort_by { |merchant, revenue| revenue }.reverse[0,number]
  end
end
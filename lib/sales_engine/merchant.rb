module SalesEngine
  class Merchant
    attr_reader :id,
                :name,
                :created_at,
                :updated_at

    def initialize(data)
      @id = data["id"]
      @name = data["name"]
      @created_at = Date.parse(data["created_at"])
      @updated_at = Date.parse(data["updated_at"])
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

    def invoices_by_date(date)
      invoices.select { |invoice| invoice.created_at == date}
    end

    def successful_invoices
      invoices.select { |invoice| invoice.successful? == true }
    end

    def successful_invoices_for_date(date)
      successful_invoices.select { |invoice| invoice.created_at == date}
    end

    def quantity
      successful_invoices.reduce(0) do |quantity, invoice|
        quantity + invoice.invoice_quantity
      end
    end

    def sum_invoices(invoices)
      invoices.reduce(0) do |revenue, invoice|
        revenue + invoice.invoice_revenue
      end
    end

    def revenue(date = nil)
      if date
        date = Date.parse(date)
        sum_invoices(successful_invoices_for_date(date))
      else
        sum_invoices(successful_invoices)
      end
    end

    def customers
      successful_invoices.collect do |invoice|
        invoice.customer
      end
    end

    def favorite_customer
      customers.group_by { |customer| customer }.max_by do |customer, count| 
        count.size
      end.first
    end

    def self.most_items(number)
      @merchants.sort_by { |merchant| merchant.quantity }.reverse.take(number)
    end

    def self.most_revenue(number)
      @merchants.sort_by { |merchant| merchant.revenue }.reverse.take(number)
    end
  end
end
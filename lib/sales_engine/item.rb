module SalesEngine
  class Item
    attr_reader :id,
                :name,
                :description,
                :unit_price,
                :merchant_id,
                :created_at,
                :updated_at

    def initialize(data)
      @id = data["id"]
      @name = data["name"]
      @description = data["description"]
      @unit_price = data["unit_price"]
      @merchant_id = data["merchant_id"]
      @created_at = Date.parse(data["created_at"])
      @updated_at = Date.parse(data["updated_at"])
    end

    def self.build_data(contents)
      @items = contents.collect { |row| Item.new(row) }
    end

    def to_s
      "#{id}:#{name}"
    end

    def self.items
      @items
    end

    def self.random
      @items.sample
    end

    def self.find_by_id(id)
      @items.find { |item| item.id == id }
    end

    def self.find_by_name(name)
      @items.find { |item| item.name == name }
    end

    def self.find_by_description(description)
      @items.find { |item| item.description == description }
    end

    def self.find_by_unit_price(unit_price)
      @items.find { |item| item.unit_price == unit_price }
    end

    def self.find_by_merchant_id(merchant_id)
      @items.find { |item| item.merchant_id == merchant_id }
    end

    def self.find_by_created_at(created_at)
      @items.find { |item| item.created_at == created_at }
    end

    def self.find_by_updated_at(updated_at)
      @items.find { |item| item.updated_at == updated_at }
    end

    def self.find_all_by_id(id)
      @items.find_all { |item| item.id == id }
    end

    def self.find_all_by_name(name)
      @items.find_all { |item| item.name == name }
    end

    def self.find_all_by_description(description)
      @items.find_all { |item| item.description == description }
    end

    def self.find_all_by_unit_price(unit_price)
      @items.find_all { |item| item.unit_price == unit_price }
    end

    def self.find_all_by_merchant_id(merchant_id)
      @items.find_all { |item| item.merchant_id == merchant_id }
    end

    def self.find_all_by_created_at(created_at)
      @items.find_all { |item| item.created_at == created_at }
    end

    def self.find_all_by_updated_at(updated_at)
      @items.find_all { |item| item.updated_at == updated_at }
    end

    def self.most_revenue(number)
      @items.sort_by { |item| item.revenue }.reverse.take(number)
    end

    def self.most_items(number)
      @items.sort_by { |item| item.quantity }.reverse.take(number)
    end

    def quantity
      successful_invoice_items.collect do |invoice_item|
        invoice_item.quantity.to_i
      end.reduce(:+) || 0
    end

    def revenue
      successful_invoice_items.collect do |invoice_item| 
        invoice_item.subtotal
      end.reduce(:+) || 0
    end

    def successful_invoice_items
      invoice_items.select { |invoice_item| invoice_item.successful? }
    end

    def sucessful_invoices
      invoices.select { |invoice| invoice.successful? }
    end

    def invoices
      invoice_items.collect { |item| item.invoice }
    end

    def invoice_items
      InvoiceItem.find_all_by_item_id(id)
    end

    def merchant
      Merchant.find_by_id(merchant_id)
    end
  end
end
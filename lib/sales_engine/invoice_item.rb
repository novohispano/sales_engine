module SalesEngine
  class InvoiceItem
    attr_reader :id,
                :item_id,
                :invoice_id,
                :quantity,
                :unit_price,
                :created_at,
                :updated_at

    def initialize(data)
      @id = data["id"].to_i
      @item_id = data["item_id"].to_i
      @invoice_id = data ["invoice_id"].to_i
      @quantity = data["quantity"].to_i
      @unit_price = data["unit_price"].to_i
      @created_at = Date.parse(data["created_at"])
      @updated_at = Date.parse(data["updated_at"])
    end

    def self.build_data(contents)
      @invoice_items = contents.collect { |row| InvoiceItem.new(row) }
    end

    def to_s
      "#{id} #{item_id} #{invoice_id}"
    end

    def self.invoice_items
      @invoice_items
    end

    def self.random
      @invoice_items.sample
    end

    def self.find_by_id(id)
      @invoice_items.find { |i_item| i_item.id == id }
    end

    def self.find_by_item_id(item_id)
      @invoice_items.find { |i_item| i_item.item_id == item_id }
    end

    def self.find_by_invoice_id(invoice_id)
      @invoice_items.find { |i_item| i_item.invoice_id == invoice_id }
    end

    def self.find_by_quantity(quantity)
      @invoice_items.find { |i_item| i_item.quantity == quantity }
    end

    def self.find_by_unit_price(unit_price)
      @invoice_items.find { |i_item| i_item.unit_price == unit_price }
    end

    def self.find_by_created_at(created_at)
      @invoice_items.find { |i_item| i_item.created_at == created_at }
    end

    def self.find_by_updated_at(updated_at)
      @invoice_items.find { |i_item| i_item.updated_at == updated_at }
    end

    def self.find_all_by_id(id)
      @invoice_items.select { |i_item| i_item.id == id }
    end

    def self.find_all_by_item_id(item_id)
      @invoice_items.select { |i_item| i_item.item_id == item_id }
    end

    def self.find_all_by_invoice_id(invoice_id)
      @invoice_items.select { |i_item| i_item.invoice_id == invoice_id }
    end

    def self.find_all_by_quantity(quantity)
      @invoice_items.select { |i_item| i_item.quantity == quantity }
    end

    def self.find_all_by_unit_price(unit_price)
      @invoice_items.select { |i_item| i_item.unit_price == unit_price }
    end

    def self.find_all_by_created_at(created_at)
      @invoice_items.select { |i_item| i_item.created_at == created_at }
    end

    def self.find_all_by_updated_at(updated_at)
      @invoice_items.select { |i_item| i_item.updated_at == updated_at }
    end

    def successful?
      invoice.successful?
    end

    def invoices
      Invoice.find_all_by_id(invoice_id)
    end

    def invoice
      Invoice.find_by_id(invoice_id)
    end

    def item
      Item.find_by_id(item_id)
    end

    def subtotal
      BigDecimal.new((quantity * unit_price)/ 100.0, 12)
    end
  end
end
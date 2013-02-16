require "csv"

class InvoiceItem
  attr_reader :id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at
  
  def initialize(data)
    @id = data["id"]
    @item_id = data["item_id"]
    @invoice_id = data ["invoice_id"]
    @quantity = data["quantity"]
    @unit_price = data["unit_price"]
    @created_at = data["created_at"]
    @updated_at = data["updated_at"]
  end

  def self.parse(filename = "./data/small_invoice_items.csv")
    @invoice_items = []
    CSV.open(filename, :headers => true).collect do |row|
      @invoice_items << InvoiceItem.new(row)
    end
  end

  def to_s
    "#{id} #{item_id} #{invoice_id}"
  end
      
  def self.random
    @invoice_items.sample
  end

  def self.invoice_items
    @invoice_items
  end

  def self.find_by_id(id)
    @invoice_items.find{|invoice_item|invoice_item.id == id}
  end

  def self.find_by_item_id(item_id)
    @invoice_items.find{|invoice_item| invoice_item.item_id == item_id}
  end
  
  def self.find_all_by_invoice_id(invoice_id)
    @invoice_items.select{|invoice_item| invoice_item.invoice_id == invoice_id}
  end  

  def self.find_all_by_quantity(quantity)
    @invoice_items.select{|invoice_item| invoice_item.quantity == quantity}
  end

  def self.find_all_by_unit_price(unit_price)
    @invoice_items.select{|invoice_item| invoice_item.unit_price == unit_price}
  end

  def self.find_all_by_created_at(created_at)
    @invoice_items.select{|invoice_item| invoice_item.created_at == created_at}
  end

  def self.find_all_by_updated_at(updated_at)
    @invoice_items.select{|invoice_item| invoice_item.updated_at == updated_at}
  end
end
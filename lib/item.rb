require "csv"

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
    @created_at = data["created_at"]
    @updated_at = data["updated_at"]
  end

  def self.parse(filename = "./data/items.csv")
    @items = []
    CSV.open(filename, :headers => true).each do |row|
      @items << Item.new(row)
    end
  end

  def self.items
    @items
  end

  def to_s
    "#{id}:#{name}"
  end

  def self.random
    @items.sample
  end

  def self.find_by_id(id)
    @items.find {|item| item.id == id}
  end

  def self.find_by_name(name)
    @items.find {|item| item.name == name}
  end

  def self.find_by_description(description)
    @items.find {|item| item.description == description}
  end

  def self.find_by_unit_price(unit_price)
    @items.find {|item| item.unit_price == unit_price}
  end

  def self.find_by_merchant_id(merchant_id)
    @items.find {|item| item.merchant_id == merchant_id}
  end

  def self.find_by_created_at(created_at)
    @items.find {|item| item.created_at == created_at}
  end

  def self.find_by_updated_at(updated_at)
    @items.find {|item| item.updated_at == updated_at}
  end

  def self.find_all_by_id(id)
    @items.find_all {|item| item.id == id}
  end

  def self.find_all_by_name(name)
    @items.find_all {|item| item.name == name}
  end

  def self.find_all_by_description(description)
    @items.find_all {|item| item.description == description}
  end

  def self.find_all_by_unit_price(unit_price)
    @items.find_all {|item| item.unit_price == unit_price}
  end

  def self.find_all_by_merchant_id(merchant_id)
    @items.find_all {|item| item.merchant_id == merchant_id}
  end

  def self.find_all_by_created_at(created_at)
    @items.find_all {|item| item.created_at == created_at}
  end

  def self.find_all_by_updated_at(updated_at)
    @items.find_all {|item| item.updated_at == updated_at}
  end

  # def merchant(merchant_id)
  #   merchant = Merchant.find_by_id(merchant_id)
  #   puts merchant
  #   return merchant
  # end
end

#Item.parse
#item = Item.random
#item
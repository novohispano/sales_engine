require "csv"

class Merchant
  attr_reader :name
  attr_reader :id

  def initialize(data)
    @id = data["id"]
    @name = data["name"]
    @created_at = data["created_at"]
    @updated_at = data["updated_at"]
  end

  def self.parse(filename = "./data/merchants.csv")
    @merchants = []
    CSV.open(filename, :headers => true).collect do |row|
      @merchants << Merchant.new(row)
    end
  end

  def self.merchants
    @merchants
  end

  def to_s
    "#{@id}:#{name}"
  end

  def self.random
    @merchants.sample
  end

  def self.find_by_name(name)
    @merchants.find {|merchant| merchant.name == name}
  end

  def self.find_by_id(id)
    @merchants.find {|merchant| merchant.id == id}
  end

  def self.find_all_by_name(name)
    @merchants.find_all {|merchant| merchant.name == name}
  end

  def self.find_all_by_id(id)
    @merchants.find_all {|merchant| merchant.id == id}
  end
end

Merchant.parse
Merchant.find_all_by_name("Cummings-Thiel")
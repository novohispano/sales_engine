require "csv"

class Merchant
  attr_reader :id
  attr_reader :name
  attr_reader :created_at
  attr_reader :updated_at

  def initialize(data)
    @id = data["id"]
    @name = data["name"]
    @created_at = data["created_at"]
    @updated_at = data["updated_at"]
  end

  def self.parse(filename = "./data/merchants.csv")
    @merchants = []
    CSV.open(filename, :headers => true).each do |row|
      @merchants << Merchant.new(row)
    end
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
    @merchants.find {|merchant| merchant.id == id}
  end

  def self.find_by_name(name)
    @merchants.find {|merchant| merchant.name == name}
  end

  def self.find_by_created_at(created_at)
    @merchants.find {|merchant| merchant.created_at == created_at}
  end

  def self.find_by_updated_at(updated_at)
    @merchants.find {|merchant| merchant.updated_at == updated_at}
  end

  def self.find_all_by_id(id)
    @merchants.find_all {|merchant| merchant.id == id}
  end

  def self.find_all_by_name(name)
    @merchants.find_all {|merchant| merchant.name == name}
  end

  def self.find_all_by_created_at(created_at)
    @merchants.find_all {|merchant| merchant.created_at == created_at}
  end

  def self.find_all_by_updated_at(updated_at)
    @merchants.find_all {|merchant| merchant.updated_at == updated_at}
  end
end
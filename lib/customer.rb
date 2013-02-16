class Customer
  attr_reader :id,
              :first_name,
              :last_name,
              :created_at,
              :updated_at
  
  def initialize(data)
    @id = data["id"]
    @first_name = data["first_name"]
    @last_name = data["last_name"]
    @created_at= data ["created_at"]
    @updated_at = data["updated_at"]
  end

  def self.build_data(contents)
    @customers = []
    contents.each do |row|
      @customers << Customer.new(row)
    end
  end

  def to_s
    "#{id} #{first_name}"
  end
      
  def self.random
    @customers.sample
  end

  def self.customers
    @customers
  end

  def self.find_by_id(id)
    @customers.find{|customer| customer.id == id}
  end

  def self.find_by_first_name(first_name)
    @customers.find{|customer| customer.first_name == first_name}
  end

  def self.find_by_last_name(last_name)
    @customers.find{|customer| customer.last_name == last_name}
  end

  def self.find_by_created_at(created_at)
    @customers.find{|customer| customer.created_at == created_at}
  end

  def self.find_by_updated_at(updated_at)
    @customers.find{|customer| customer.updated_at == updated_at}
  end

  def self.find_all_by_id(id)
    @customers.select{|customer| customer.id == id}
  end

  def self.find_all_by_first_name(first_name)
    @customers.select{|customer| customer.first_name == first_name}
  end

  def self.find_all_by_last_name(last_name)
    @customers.select{|customer| customer.last_name == last_name}
  end

  def self.find_all_by_created_at(created_at)
    @customers.select{|customer| customer.created_at == created_at}
  end

  def self.find_all_by_updated_at(updated_at)
    @customers.select{|customer| customer.updated_at == updated_at}
  end
end
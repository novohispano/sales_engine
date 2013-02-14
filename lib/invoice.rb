require "csv"

# id,customer_id,merchant_id,status,created_at,updated_at

class Invoice
  attr_reader :id, :customer_id, :merchant_id, :status, :created_at, :updated_at
  

  def initialize(data)
    @id = data["id"]
    @customer_id = data["customer_id"]
    @merchant_id= data ["merchant_id"]
    @status = data["status"]
    @created_at = data["created_at"]
    @updated_at = data["created_at"]
  end

  def self.parse(filename = "./data/small_invoice.csv")
    @invoices = []
    CSV.open(filename, :headers => true).collect do |row|
      @invoices << Invoice.new(row)
    end
  end

  def to_s
    "#{id} #{customer_id} #{merchant_id} #{status}"
  end
      # puts "Parsed #{@invoice.count} invoice."
      # puts @invoice.to_s


  def self.random
    @invoices.sample
  end

  def self.invoices
    @invoices
  end

  def self.find_by_customer_id(customer_id)
    @invoices.find{|invoice| invoice.customer_id == customer_id}
  end

  def self.find_all_by_customer_id(customer_id)
    @invoices.select{|invoice| invoice.customer_id == customer_id}
  end  

  def self.find_by_merchant_id(merchant_id)
    @invoices.find{|invoice| invoice.merchant_id == merchant_id}
  end

  def self.find_by_id(id)
    @invoices.find{|invoice| invoice.id == id}
  end

  def self.find_all_by_merchant_id(merchant_id)
    @invoices.select{|invoice| invoice.merchant_id == merchant_id}
  end

  def self.find_by_status(status)
    @invoices.find{|invoice| invoice.status == status}
  end

  def self.find_all_by_status(status)
    @invoices.select{|invoice| invoice.status == status}
  end


      # find_by_id
      # find_by_customer_id
      # find_all_by_customer_id
      # find_by_merchant_id
      # find_all_by_merchant_id
      # find_by_status
      # find_all_by_status
  #end

  # def self.find_all_by_customer_id(invoice)
  #   CSV.open("invoice.csv").collect do |row|
  #     Invoice.new(row)
      #if no match, invoice will have an empty array[]
    #end
  #end x 

end

Invoice.parse 
Invoice.random
Invoice.find_by_customer_id("3")
#Invoice.find_all_by_customer_id
#Invoice.find_all_by_merchant_id
Invoice.find_by_status("19:54:10")
Invoice.find_by_id("12")
#Invoice.find_all_by_status
Invoice.find_by_merchant_id("75")

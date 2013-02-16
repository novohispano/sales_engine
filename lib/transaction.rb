require "csv"

class Transaction
  attr_reader :id,
              :invoice_id,
              :credit_card_number,
              :credit_card_expiration_date,
              :result,
              :created_at,
              :updated_at

  def initialize(data)
    @id = data["id"]
    @invoice_id = data["invoice_id"]
    @credit_card_number = data["credit_card_number"]
    @credit_card_expiration_date = data["credit_card_expiration_date"]
    @result = data["result"]
    @created_at = data["created_at"]
    @updated_at = data["updated_at"]
  end

  def self.parse(filename = "./data/transactions.csv")
    @transactions = []
    CSV.open(filename, :headers => true).each do |row|
      @transactions << Transaction.new(row)
    end
  end

  def self.transactions
    @transactions
  end

  def to_s
    "#{id}: #{invoice_id}: #{result}"
  end

  def self.random
    @transactions.sample
  end

  def self.find_by_id(id)
    @transactions.find {|transaction| transaction.id == id}
  end

  def self.find_by_invoice_id(invoice_id)
    @transactions.find {|transaction| transaction.invoice_id == invoice_id}
  end

  def self.find_by_result(result)
    @transactions.find {|transaction| transaction.result == result}
  end

  def self.find_by_created_at(created_at)
    @transactions.find {|transaction| transaction.created_at == created_at}
  end

  def self.find_by_updated_at(updated_at)
    @transactions.find {|transaction| transaction.updated_at == updated_at}
  end

  def self.find_all_by_id(id)
    @transactions.find_all {|transaction| transaction.id == id}
  end

  def self.find_all_by_invoice_id(invoice_id)
    @transactions.find_all {|transaction| transaction.invoice_id == invoice_id}
  end

  def self.find_all_by_result(result)
    @transactions.find_all {|transaction| transaction.result == result}
  end

  def self.find_all_by_created_at(created_at)
    @transactions.find_all {|transaction| transaction.created_at == created_at}
  end

  def self.find_all_by_updated_at(updated_at)
    @transactions.find_all {|transaction| transaction.updated_at == updated_at}
  end
end
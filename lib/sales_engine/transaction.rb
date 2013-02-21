module SalesEngine
  class Transaction
    attr_reader :id,
                :invoice_id,
                :credit_card_number,
                :credit_card_expiration_date,
                :result,
                :created_at,
                :updated_at

    def initialize(data)
      @id = data["id"].to_i
      @invoice_id = data["invoice_id"].to_i
      @credit_card_number = data["credit_card_number"]
      @credit_card_expiration_date = data["credit_card_expiration_date"]
      @result = data["result"]
      @created_at = Date.parse(data["created_at"])
      @updated_at = Date.parse(data["updated_at"])
    end

    def self.build_data(contents)
      @transactions = contents.collect { |row| Transaction.new(row) }
    end

    def to_s
      "#{id}: #{invoice_id}: #{result}"
    end

    def self.transactions
      @transactions
    end

    def self.random
      @transactions.sample
    end

    def self.find_by_id(id)
      @transactions.find { |txn| txn.id == id }
    end

    def self.find_by_invoice_id(invoice_id)
      @transactions.find { |txn| txn.invoice_id == invoice_id }
    end

    def self.find_by_result(result)
      @transactions.find { |txn| txn.result == result }
    end

    def self.find_by_created_at(created_at)
      @transactions.find { |txn| txn.created_at == created_at }
    end

    def self.find_by_updated_at(updated_at)
      @transactions.find { |txn| txn.updated_at == updated_at }
    end

    def self.find_all_by_id(id)
      @transactions.find_all { |txn| txn.id == id }
    end

    def self.find_all_by_invoice_id(invoice_id)
      @transactions.find_all { |txn| txn.invoice_id == invoice_id }
    end

    def self.find_all_by_result(result)
      @transactions.find_all { |txn| txn.result == result }
    end

    def self.find_all_by_created_at(created_at)
      @transactions.find_all { |txn| txn.created_at == created_at }
    end

    def self.find_all_by_updated_at(updated_at)
      @transactions.find_all { |txn| txn.updated_at == updated_at }
    end

    def self.find_by_credit_card_number(number)
      @transactions.find { |txn| txn.credit_card_number == number }
    end

    def invoice
      Invoice.find_by_id(invoice_id)
    end
  end
end
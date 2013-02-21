require './test/test_helper'

module SalesEngine
  class TransactionTest < MiniTest::Unit::TestCase
    def setup
      Parser.new
    end

    def test_it_is_initialized_from_an_array_of_data
      assert_equal "1", Transaction.transactions[0].id
      assert_equal "1", Transaction.transactions[0].invoice_id
      assert_equal "4654405418249632", Transaction.transactions[0].credit_card_number
      assert_equal nil, Transaction.transactions[0].credit_card_expiration_date
      assert_equal "success", Transaction.transactions[0].result
      assert_equal Date.parse("2012-03-27 14:54:09 UTC"), Transaction.transactions[0].created_at
      assert_equal Date.parse("2012-03-27 14:54:09 UTC"), Transaction.transactions[0].updated_at
    end

    def test_it_can_return_a_random_value
      10.times do
        refute_equal Transaction.random.to_s, Transaction.random.to_s
      end
    end

    def test_it_can_find_a_transaction_by_id
      assert_equal "5: 6: success", Transaction.find_by_id("5").to_s
    end

    def test_it_can_find_a_transaction_by_invoice_id
      assert_equal "5: 6: success", Transaction.find_by_invoice_id("6").to_s
    end

    def test_it_can_find_a_transaction_by_result
      assert_equal "1: 1: success", Transaction.find_by_result("success").to_s
    end

    def test_it_can_find_a_transaction_by_created_at
      assert_equal "1: 1: success", Transaction.find_by_created_at(Date.parse("2012-03-27 14:54:09 UTC")).to_s
    end

    def test_it_can_find_a_transaction_by_updated_at
      assert_equal "1: 1: success", Transaction.find_by_updated_at(Date.parse("2012-03-27 14:54:09 UTC")).to_s
    end

    def test_it_can_find_all_transactions_by_id
      transactions = Transaction.find_all_by_id("5")
      assert_equal 1, transactions.count
      transactions.each do |transaction|
        assert_includes "5: 6: success", transaction.to_s
      end
    end

    def test_it_can_find_all_transactions_by_invoice_id
      transactions = Transaction.find_all_by_invoice_id("13")
      assert_equal 2, transactions.count
      transactions.each do |transaction|
        assert_includes "14: 13: failed, 15: 13: failed", transaction.to_s
      end
    end

    def test_it_can_find_all_transactions_by_result
      transactions = Transaction.find_all_by_result("failed")
      assert_equal 947, transactions.count
    end

    def test_it_can_find_all_transactions_by_created_at
      created_at = Date.parse("2012-03-27 14:54:09 UTC")
      transactions = Transaction.find_all_by_created_at(created_at)
      assert_equal 5595, transactions.count
    end

    def test_it_can_find_all_transactions_by_updated_at
      updated_at = Date.parse("2012-03-27 14:54:09 UTC")
      transactions = Transaction.find_all_by_updated_at(updated_at)
      assert_equal 5595, transactions.count
    end

    def test_it_can_find_an_invoice_associated_with_a_transaction
      transaction = Transaction.find_by_id("11")
      assert_equal "12 3 8 shipped", transaction.invoice.to_s
    end
  end
end
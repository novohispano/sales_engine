require './test/test_helper'

class InvoiceTest < MiniTest::Unit::TestCase
  def test_it_is_initialized_from_an_array_of_data
    Parser.new
    assert_equal "1", Invoice.invoices[0].id
    assert_equal "1", Invoice.invoices[0].customer_id
    assert_equal "26", Invoice.invoices[0].merchant_id
    assert_equal "shipped", Invoice.invoices[0].status
    assert_equal "2012-03-25 09:54:09 UTC", Invoice.invoices[0].created_at
    assert_equal "2012-03-25 09:54:09 UTC", Invoice.invoices[0].updated_at
  end

  def test_it_can_return_a_random_value
    Parser.new
    refute_equal Invoice.random.to_s, Invoice.random.to_s
  end

  def test_it_can_find_by_id
    Parser.new
    assert_equal "1 1 26 shipped", Invoice.find_by_id("1").to_s
  end

  def test_it_can_find_by_customer_id
    Parser.new
    assert_equal "1 1 26 shipped", Invoice.find_by_customer_id("1").to_s
  end

  def test_it_can_find_by_merchant_id
    Parser.new
    assert_equal "1 1 26 shipped", Invoice.find_by_merchant_id("26").to_s
  end

  def test_it_can_find_by_status
    Parser.new
    assert_equal "1 1 26 shipped", Invoice.find_by_status("shipped").to_s
  end

  def test_it_can_find_by_created_at
    Parser.new
    assert_equal "1 1 26 shipped", Invoice.find_by_created_at("2012-03-25 09:54:09 UTC").to_s
  end

  def test_it_can_find_by_updated_at
    Parser.new
    assert_equal "1 1 26 shipped", Invoice.find_by_updated_at("2012-03-25 09:54:09 UTC").to_s
  end

  def test_it_can_find_all_by_id
    Parser.new
    invoices = Invoice.find_all_by_id("1")
    assert_equal 1, invoices.count
    invoices.each do |invoice|
      assert_includes "1 1 26 shipped", invoice.to_s
    end
  end

  def test_it_can_find_all_by_customer_id
    Parser.new
    invoices = Invoice.find_all_by_customer_id("3")
    assert_equal 4, invoices.count
    invoices.each do |invoice|
      assert_includes "10 3 86 shipped, 11 3 62 shipped, 12 3 8 shipped, 13 3 34 shipped", invoice.to_s
    end
  end

  def test_it_can_find_all_by_merchant_id
    Parser.new
    invoices = Invoice.find_all_by_merchant_id("26")
    assert_equal 48, invoices.count
  end

  def test_it_can_find_all_by_status
    Parser.new
    invoices = Invoice.find_all_by_status("shipped")
    assert_equal 4843, invoices.count
  end

  def test_it_can_find_all_by_created_at
    Parser.new
    invoices = Invoice.find_all_by_created_at("2012-03-25 09:54:09 UTC")
    assert_equal 1, invoices.count
    invoices.each do |invoice|
      assert_includes "1 1 26 shipped", invoice.to_s
    end
  end

  def test_it_can_find_all_by_updated_at
    Parser.new
    invoices = Invoice.find_all_by_updated_at("2012-03-25 09:54:09 UTC")
    assert_equal 1, invoices.count
    invoices.each do |invoice|
      assert_includes "1 1 26 shipped", invoice.to_s
    end
  end

  def test_it_can_find_all_transactions_for_an_invoice
    Parser.new
    invoice = Invoice.find_by_id("12")
    assert_equal 3, invoice.transactions.count
    invoice.transactions.each do |transaction|
      assert_includes "11: 12: failed, 12: 12: failed, 13: 12: success", transaction.to_s
    end
  end

  def test_it_can_find_all_invoices_items_associated_to_an_invoice
    Parser.new
    invoice = Invoice.find_by_id("12")
    assert_equal 6, invoice.invoice_items.count
    invoice.invoice_items.each do |invoice_item|
      assert_includes "56 150 12, 57 127 12, 58 156 12, 59 160 12, 60 127 12, 61 134 12", invoice_item.to_s
    end
  end

  def test_it_can_find_the_customer_associated_with_an_invoice
    Parser.new
    invoice = Invoice.find_by_id("12")
    assert_equal "3 Mariah", invoice.customer.to_s
  end
end
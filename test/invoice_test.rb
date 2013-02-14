require './test/test_helper'

#id,customer_id,merchant_id,status,created_at,updated_at

#1,1,26,shipped,2012-03-25 09:54:09 UTC,2012-03-25 09:54:09 UTC
      # find_by_customer_id
      # find_all_by_customer_id
      # find_by_merchant_id
      # find_all_by_merchant_id
      # find_by_status
      # find_all_by_status

class InvoiceTest < MiniTest::Unit::TestCase
  def test_it_is_initialized_from_an_array_of_data
    Invoice.parse
    assert_equal "1", Invoice.invoices[0].id
    assert_equal "1", Invoice.invoices[0].customer_id
    assert_equal "26", Invoice.invoices[0].merchant_id
    assert_equal "shipped", Invoice.invoices[0].status
    assert_equal "2012-03-25 09:54:09 UTC", Invoice.invoices[0].created_at
    assert_equal "2012-03-25 09:54:09 UTC", Invoice.invoices[0].updated_at
  end

  def test_it_can_return_a_random_value
    Invoice.parse
    refute_equal Invoice.random.to_s, Invoice.random.to_s
  end

  def test_it_can_find_by_customer_id
    Invoice.parse
    assert_equal "1 1 26 shipped", Invoice.find_by_customer_id("1").to_s
  end

  def test_it_can_find_status
    Invoice.parse
    assert_equal "3 1 78 shipped", Invoice.find_by_id("3").to_s
  end

  def test_it_can_find_all_by_status
    Invoice.parse
    invoices = Invoice.find_all_by_status("shipped")
    assert_equal 14, invoices.count
    invoices.each do |invoice|
      assert_includes "1 1 26 shipped, 2 1 75 shipped, 3 1 78 shipped, 4 1 33 shipped, 5 1 41 shipped, 6 1 76 shipped, 7 1 44 shipped, 8 1 38 shipped, 9 2 27 shipped, 10 3 86 shipped, 11 3 62 shipped, 12 3 8 shipped, 13 3 34 shipped, 14 4 44 shipped", invoice.to_s
    end
  end

  def test_it_can_find_by_merchant_id
    Invoice.parse
    assert_equal "1 1 26 shipped", Invoice.find_by_merchant_id("26").to_s
  end

  def test_it_can_find_all_by_merchant_id
    Invoice.parse
    invoices = Invoice.find_all_by_merchant_id("26")
    assert_equal 1, invoices.count
    invoices.each do |invoice|
      assert_includes "1 1 26 shipped", invoice.to_s
    end
  end

  # def test_it_can_find_all_customer_id
  #   Invoice.parse
  #   invoices = Invoice.find_all_by_customer_id("customer_id")
  #   assert_equal 9, invoices.count
  #   invoices.each do |invoice|
  #     assert_includes "1:26, 2:75, 3:78", invoice.to_s
  #   end
  # end

  def test_it_can_find_all_by_customer_id
    Invoice.parse
    invoices = Invoice.find_all_by_customer_id("3")
    assert_equal 4, invoices.count
    invoices.each do |invoice|
      assert_includes "10 3 86 shipped, 11 3 62 shipped, 12 3 8 shipped, 13 3 34 shipped", invoice.to_s
    end
  end
end
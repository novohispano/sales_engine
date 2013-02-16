require './test/test_helper'
require './lib/invoice_item'

class InvoiceItemTest < MiniTest::Unit::TestCase

  def test_it_is_initialized_from_an_array_of_data
    InvoiceItem.parse
    assert_equal "1", InvoiceItem.invoice_items[0].id
    assert_equal "539", InvoiceItem.invoice_items[0].item_id
    assert_equal "1", InvoiceItem.invoice_items[0].invoice_id
    assert_equal "5", InvoiceItem.invoice_items[0].quantity
    assert_equal "13635", InvoiceItem.invoice_items[0].unit_price
    assert_equal "2012-03-27 14:54:09 UTC", InvoiceItem.invoice_items[0].created_at
    assert_equal "2012-03-27 14:54:09 UTC", InvoiceItem.invoice_items[0].updated_at
  end

  def test_it_exists
    invoice_items = InvoiceItem.new({})
    assert_kind_of InvoiceItem, invoice_items
  end

  def test_it_can_return_a_random_value
    InvoiceItem.parse
    refute_equal InvoiceItem.random.to_s, InvoiceItem.random.to_s
  end

  def test_it_can_find_invoice_item_by_id
    InvoiceItem.parse
    assert_equal "1 539 1", InvoiceItem.find_by_id("1").to_s
  end

  def test_it_can_find_invoice_item_by_item_id
    InvoiceItem.parse
    assert_equal "1 539 1", InvoiceItem.find_by_item_id("539").to_s
  end  

  def test_it_can_find_invoice_item_all_by_quantity
    InvoiceItem.parse
    invoice_items = InvoiceItem.find_all_by_quantity("9")
    invoice_items.each do |item|
      assert_includes "2 528 1", item.to_s
    end
  end

  def test_it_can_find_invoice_item_all_by_invoice_id
    InvoiceItem.parse
    invoice_items = InvoiceItem.find_all_by_invoice_id("3")
    invoice_items.each do |item|
      assert_includes "13 1921 3, 14 1920 3", item.to_s
    end
  end

  def test_it_can_find_invoice_item_all_by_unit_price
    InvoiceItem.parse
    invoice_items = InvoiceItem.find_all_by_unit_price("13635")
    invoice_items.each do |item|
      assert_includes "1 539 1", item.to_s
    end
  end

  def test_it_can_find_invoice_item_all_by_created_at
    InvoiceItem.parse
    invoice_items = InvoiceItem.find_all_by_created_at("2012-03-27 14:54:09 UTC")
    invoice_items.each do |item|
      assert_includes "1 539 1, 2 528 1, 3 523 1, 4 535 1, 5 529 1, 6 541 1, 7 530 1, 8 534 1, 9 1832 2, 10 1830 2, 11 1849 2, 12 1845 2, 13 1921 3, 14 1920 3", item.to_s
    end
  end

  def test_it_can_find_invoice_items_all_by_updated_at
    InvoiceItem.parse
    invoice_items = InvoiceItem.find_all_by_updated_at("2012-03-27 14:54:09 UTC")
    invoice_items.each do |item|
      assert_includes "1 539 1, 2 528 1, 3 523 1, 4 535 1, 5 529 1, 6 541 1, 7 530 1, 8 534 1, 9 1832 2, 10 1830 2, 11 1849 2, 12 1845 2, 13 1921 3, 14 1920 3", item.to_s
    end
  end
end
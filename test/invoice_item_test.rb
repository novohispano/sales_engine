require './test/test_helper'

class InvoiceItemTest < MiniTest::Unit::TestCase
  def test_it_is_initialized_from_an_array_of_data
    Parser.new
    assert_equal "1", InvoiceItem.invoice_items[0].id
    assert_equal "539", InvoiceItem.invoice_items[0].item_id
    assert_equal "1", InvoiceItem.invoice_items[0].invoice_id
    assert_equal "5", InvoiceItem.invoice_items[0].quantity
    assert_equal "13635", InvoiceItem.invoice_items[0].unit_price
    assert_equal "2012-03-27 14:54:09 UTC", InvoiceItem.invoice_items[0].created_at
    assert_equal "2012-03-27 14:54:09 UTC", InvoiceItem.invoice_items[0].updated_at
  end

  def test_it_can_return_a_random_value
    Parser.new
    refute_equal InvoiceItem.random.to_s, InvoiceItem.random.to_s
  end

  def test_it_can_find_an_invoice_item_by_id
    Parser.new
    assert_equal "1 539 1", InvoiceItem.find_by_id("1").to_s
  end

  def test_it_can_find_invoice_item_by_item_id
    Parser.new
    assert_equal "1 539 1", InvoiceItem.find_by_item_id("539").to_s
  end  

  def test_it_can_find_invoice_item_by_invoice_id
    Parser.new
    assert_equal "9 1832 2", InvoiceItem.find_by_invoice_id("2").to_s
  end  

  def test_it_can_find_invoice_item_by_quantity
    Parser.new
    assert_equal "2 528 1", InvoiceItem.find_by_quantity("9").to_s
  end

  def test_it_can_find_invoice_item_by_unit_price
    Parser.new
    assert_equal "7 530 1", InvoiceItem.find_by_unit_price("66747").to_s
  end

  def test_it_can_find_invoice_item_by_created_at
    Parser.new
    assert_equal "205 2089 46", InvoiceItem.find_by_created_at("2012-03-27 14:54:12 UTC").to_s
  end

  def test_it_can_find_invoice_item_by_updated_at
    Parser.new
    assert_equal "113 1927 22", InvoiceItem.find_by_updated_at("2012-03-27 14:54:11 UTC").to_s
  end

  def test_it_can_find_all_invoice_items_by_id
    Parser.new
    invoice_items = InvoiceItem.find_all_by_id("1")
    assert_equal 1, invoice_items.count
    invoice_items.each do |item|
      assert_includes "1 539 1", item.to_s
    end
  end

  def test_it_can_find_all_invoice_items_by_invoice_id
    Parser.new
    invoice_items = InvoiceItem.find_all_by_invoice_id("3")
    assert_equal 8, invoice_items.count
  end

  def test_it_can_find_all_invoice_items_by_item_id
    Parser.new
    invoice_items = InvoiceItem.find_all_by_item_id("1918")
    assert_equal 33, invoice_items.count
  end

  def test_it_can_find_all_invoice_items_by_quantity
    Parser.new
    invoice_items = InvoiceItem.find_all_by_quantity("10")
    assert_equal 2140, invoice_items.count
  end

  def test_it_can_find_all_invoice_items_by_unit_price
    Parser.new
    invoice_items = InvoiceItem.find_all_by_unit_price("13635")
    assert_equal 7, invoice_items.count
  end

  def test_it_can_find_all_invoice_items_by_created_at
    Parser.new
    invoice_items = InvoiceItem.find_all_by_created_at("2012-03-27 14:54:09 UTC")
    assert_equal 15, invoice_items.count
  end

  def test_it_can_find_all_invoice_items_by_updated_at
    Parser.new
    invoice_items = InvoiceItem.find_all_by_updated_at("2012-03-27 14:54:10 UTC")
    assert_equal 97, invoice_items.count
  end

  def test_it_can_find_invoice_for_a_invoice_item
    Parser.new
    invoice_item = InvoiceItem.find_by_id("2")
    assert_equal "1 1 26 shipped", invoice_item.invoice.to_s
  end

  def test_it_can_find_item_for_a_invoice_item
    Parser.new
    invoice_item = InvoiceItem.find_by_id("3")
    assert_equal "523:Item Pariatur Quia", invoice_item.item.to_s
  end

  def test_it_can_process_subtotal
    Parser.new
    invoice_item = InvoiceItem.find_by_id("1")
    assert_equal 681.75, invoice_item.subtotal
  end
end
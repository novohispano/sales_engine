require './test/test_helper'

class ItemTest < MiniTest::Unit::TestCase
  def setup
    Parser.new
  end

  def test_it_is_initialized_from_an_array_of_data
    assert_equal "1", Item.items[0].id
    assert_equal "Item Qui Esse", Item.items[0].name
    assert_equal "Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.", Item.items[0].description
    assert_equal "75107", Item.items[0].unit_price
    assert_equal "1", Item.items[0].merchant_id
    assert_equal Date.parse("2012-03-27 14:53:59 UTC"), Item.items[0].created_at
    assert_equal Date.parse("2012-03-27 14:53:59 UTC"), Item.items[0].updated_at
  end

  def test_it_can_return_a_random_value
    10.times do
      refute_equal Item.random.to_s, Item.random.to_s
    end
  end

  def test_it_can_find_an_item_by_id
    assert_equal "5:Item Expedita Aliquam", Item.find_by_id("5").to_s
  end

  def test_it_can_find_an_item_by_name
    assert_equal "5:Item Expedita Aliquam", Item.find_by_name("Item Expedita Aliquam").to_s
  end

  def test_it_can_find_an_item_by_description
    assert_equal "2072:Item Esse Aut", Item.find_by_description("Qui commodi veritatis eius dolores explicabo laborum. Officia eveniet exercitationem voluptatem. Aut aut consequuntur amet. Aut earum ducimus.").to_s
  end

  def test_it_can_find_an_item_by_unit_price
    assert_equal "1980:Item Ut Voluptatem", Item.find_by_unit_price("98771").to_s
  end

  def test_it_can_find_an_item_by_merchant_id
    assert_equal "1:Item Qui Esse", Item.find_by_merchant_id("1").to_s
  end

  def test_it_can_find_an_item_by_created_at
    assert_equal "1:Item Qui Esse", Item.find_by_created_at(Date.parse("2012-03-27 14:53:59 UTC")).to_s
  end

  def test_it_can_find_an_item_by_updated_at
    assert_equal "1:Item Qui Esse", Item.find_by_updated_at(Date.parse("2012-03-27 14:53:59 UTC")).to_s
  end

  def test_it_can_find_all_items_by_id
    items = Item.find_all_by_id("5")
    assert_equal 1, items.count
    items.each do |item|
      assert_includes "5:Item Expedita Aliquam", item.to_s
    end
  end

  def test_it_can_find_all_items_by_name
    items = Item.find_all_by_name("Item Qui Esse")
    assert_equal 1, items.count
    items.each do |item|
      assert_includes "1:Item Qui Esse", item.to_s
    end
  end

  def test_it_can_find_all_items_by_description
    items = Item.find_all_by_description("Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.")
    assert_equal 1, items.count
    items.each do |item|
      assert_includes "1:Item Qui Esse", item.to_s
    end
  end

  def test_it_can_find_all_items_by_unit_price
    items = Item.find_all_by_unit_price("68723")
    assert_equal 1, items.count
    items.each do |item|
      assert_includes "5:Item Expedita Aliquam", item.to_s
    end
  end

  def test_it_can_find_all_items_by_merchant_id
    items = Item.find_all_by_merchant_id("1")
    assert_equal 15, items.count
    items.each do |item|
      assert_includes items[0..14].to_s, item.to_s
    end
  end

  def test_it_can_find_all_items_by_created_at
    created_at = Date.parse("2012-03-27 14:53:59 UTC")
    items = Item.find_all_by_created_at(created_at)
    assert_equal 2483, items.count
  end

  def test_it_can_find_all_items_by_updated_at
    updated_at = Date.parse("2012-03-27 14:54:08 UTC")
    items = Item.find_all_by_updated_at(updated_at)
    assert_equal 2483, items.count
  end

  def test_it_can_find_all_invoice_items_related_to_item
    item = Item.find_by_id("2")
    assert_equal 17, item.invoice_items.count
  end

  def test_it_can_find_a_merchant_related_to_item
    item = Item.find_by_id("2")
    assert_equal "1:Schroeder-Jerde", item.merchant.to_s
  end

  def test_it_can_get_revenue_for_item
    item = Item.find_by_id("227")
    assert_equal "0.114839374E7", item.revenue.to_s
  end

  def test_it_can_get_items_sorted_by_most_revenue
    assert_equal 10, Item.most_revenue(10).count
    assert_equal "[227:Item Dicta Autem]", Item.most_revenue(1).to_s
  end

  def test_it_can_get_items_sorted_by_quantity
    assert_equal 20, Item.most_items(20).count
    assert_equal "[227:Item Dicta Autem]", Item.most_revenue(1).to_s
  end 
end
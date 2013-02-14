require './test/test_helper'

class ItemTest < MiniTest::Unit::TestCase
  def test_it_is_initialized_from_an_array_of_data
    Item.parse
    assert_equal "1", Item.items[0].id
    assert_equal "Item Qui Esse", Item.items[0].name
    assert_equal "Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.", Item.items[0].description
    assert_equal "75107", Item.items[0].unit_price
    assert_equal "1", Item.items[0].merchant_id
    assert_equal "2012-03-27 14:53:59 UTC", Item.items[0].created_at
    assert_equal "2012-03-27 14:53:59 UTC", Item.items[0].updated_at
  end

  def test_it_can_return_a_random_value
    Item.parse
    10.times do
      refute_equal Item.random.to_s, Item.random.to_s
    end
  end

  def test_it_can_find_an_item_by_id
    Item.parse
    assert_equal "5:Item Expedita Aliquam", Item.find_by_id("5").to_s
  end

  def test_it_can_find_an_item_by_name
    Item.parse
    assert_equal "5:Item Expedita Aliquam", Item.find_by_name("Item Expedita Aliquam").to_s
  end

  def test_it_can_find_an_item_by_created_at
    Item.parse
    assert_equal "1:Item Qui Esse", Item.find_by_created_at("2012-03-27 14:53:59 UTC").to_s
  end

  def test_it_can_find_an_item_by_updated_at
    Item.parse
    assert_equal "1:Item Qui Esse", Item.find_by_updated_at("2012-03-27 14:53:59 UTC").to_s
  end

  def test_it_can_find_all_items_by_id
    Item.parse
    items = Item.find_all_by_id("5")
    assert_equal 1, items.count
    items.each do |item|
      assert_includes "5:Item Expedita Aliquam", item.to_s
    end
  end

  def test_it_can_find_all_items_by_name
    Item.parse
    items = Item.find_all_by_name("Item Qui Esse")
    assert_equal 1, items.count
    items.each do |item|
      assert_includes "1:Item Qui Esse", item.to_s
    end
  end

  def test_it_can_find_all_items_by_created_at
    Item.parse
    items = Item.find_all_by_created_at("2012-03-27 14:53:59 UTC")
    assert_equal 9, items.count
    items.each do |item|
      assert_not_includes "2483:Item Fuga Est", item.to_s
    end
  end

  def test_it_can_find_all_items_by_updated_at
    Item.parse
    items = Item.find_all_by_updated_at("2012-03-27 14:54:09 UTC")
    assert_equal 1, items.count
    items.each do |item|
      assert_not_includes "1:Item Qui Esse", item.to_s
    end
  end
end
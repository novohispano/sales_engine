require './test/test_helper'

class MerchantTest < MiniTest::Unit::TestCase
  def test_it_is_initialized_from_an_array_of_data
    Parser.new
    assert_equal "1", Merchant.merchants[0].id
    assert_equal "Schroeder-Jerde", Merchant.merchants[0].name
    assert_equal "2012-03-27 14:53:59 UTC", Merchant.merchants[0].created_at
    assert_equal "2012-03-27 16:12:25 UTC", Merchant.merchants[5].updated_at
  end

  def test_it_can_return_a_random_value
    Parser.new
    10.times do
      refute_equal Merchant.random.to_s, Merchant.random.to_s
    end
  end

  def test_it_can_find_a_merchant_by_id
    Parser.new
    assert_equal "5:Williamson Group", Merchant.find_by_id("5").to_s
  end

  def test_it_can_find_a_merchant_by_name
    Parser.new
    assert_equal "5:Williamson Group", Merchant.find_by_name("Williamson Group").to_s
  end

  def test_it_can_find_a_merchant_by_created_at
    Parser.new
    assert_equal "1:Schroeder-Jerde", Merchant.find_by_created_at("2012-03-27 14:53:59 UTC").to_s
  end

  def test_it_can_find_a_merchant_by_updated_at
    Parser.new
    assert_equal "6:Williamson Group", Merchant.find_by_updated_at("2012-03-27 16:12:25 UTC").to_s
  end

  def test_it_can_find_all_merchants_by_id
    Parser.new
    merchants = Merchant.find_all_by_id("5")
    assert_equal 1, merchants.count
    merchants.each do |merchant|
      assert_includes "5:Williamson Group", merchant.to_s
    end
  end

  def test_it_can_find_all_merchants_by_name
    Parser.new
    merchants = Merchant.find_all_by_name("Williamson Group")
    assert_equal 2, merchants.count
    merchants.each do |merchant|
      assert_includes "5:Williamson Group, 6:Williamson Group", merchant.to_s
    end
  end

  def test_it_can_find_all_merchants_by_created_at
    Parser.new
    merchants = Merchant.find_all_by_created_at("2012-03-27 14:53:59 UTC")
    assert_equal 9, merchants.count
    merchants.each do |merchant|
      assert_includes "1:Schroeder-Jerde, 2:Klein, Rempel and Jones, 3:Willms and Sons, 4:Cummings-Thiel, 5:Williamson Group, 6:Williamson Group, 7:Bernhard-Johns, 8:Osinski\, Pollich and Koelpin, 9:Hand-Spencer", merchant.to_s
    end
  end

  def test_it_can_find_all_merchants_by_updated_at
    Parser.new
    merchants = Merchant.find_all_by_updated_at("2012-03-27 16:12:25 UTC")
    assert_equal 1, merchants.count
    merchants.each do |merchant|
      assert_includes "6:Williamson Group", merchant.to_s
    end
  end

  def test_it_can_find_all_items_for_a_merchant
    Parser.new
    merchant = Merchant.find_by_id("2")
    assert_equal 38, merchant.items.count
  end

  def test_it_can_find_all_invoices_for_a_merchant
    Parser.new
    merchant = Merchant.find_by_id("3")
    assert_equal 43, merchant.invoices.count
  end

  def test_it_can_return_successful_invoices
    Parser.new
    merchant = Merchant.find_by_id("2")
    assert_equal 47, merchant.successful_invoices.count
    merchant.successful_invoices.each do |invoice|
      assert_equal true, invoice.successful?
    end
  end

  def test_it_can_get_total_revenue
    Parser.new
    merchant = Merchant.find_by_id("2")
    assert_equal 436253.18999999994, merchant.revenue
  end
end
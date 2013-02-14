require './test/bundler'

class MerchantTest < MiniTest::Unit::TestCase
  def test_it_is_initialized_from_an_array_of_data
    Merchant.parse
    assert_equal "1", Merchant.merchants[0].id
    assert_equal "Schroeder-Jerde", Merchant.merchants[0].name
  end

  def test_it_can_find_a_merchant_by_name
    Merchant.parse
    assert_equal "5:Williamson Group", Merchant.find_by_name("Williamson Group").to_s
  end

  def test_it_can_find_a_merchant_by_id
    Merchant.parse
    assert_equal "5:Williamson Group", Merchant.find_by_id("5").to_s
  end

  def test_it_can_find_all_merchants_by_name
    Merchant.parse
    merchants = Merchant.find_all_by_name("Williamson Group")
    assert_equal 2, merchants.count
    merchants.each do |merchant|
      assert_includes "5:Williamson Group, 6:Williamson Group", merchant.to_s
    end
  end

  def test_it_can_find_all_merchants_by_id
    Merchant.parse
    merchants = Merchant.find_all_by_id("5")
    assert_equal 1, merchants.count
    merchants.each do |merchant|
      assert_includes "5:Williamson Group", merchant.to_s
    end
  end  
end
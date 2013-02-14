require './test/test_helper'

class CustomerTest < MiniTest::Unit::TestCase
  def test_it_is_initialized_from_an_array_of_data
    
    Customer.parse
    assert_equal "11", Customer.customers[10].id
    assert_equal "Logan", Customer.customers[10].first_name
  end

  def test_it_can_return_a_random_value
    Customer.parse
    refute_equal Customer.random.to_s, Customer.random.to_s
  end

  def test_it_can_find_a_customer_by_id
    Customer.parse
    assert_equal "3 Mariah", Customer.find_by_id("3").to_s
  end

  def test_it_can_find_a_customer_by_last_name
    Customer.parse
    assert_equal "3 Mariah", Customer.find_by_last_name("Toy").to_s
  end

  def test_it_can_find_a_customer_by_created_at
    Customer.parse
    assert_equal "11 Logan", Customer.find_by_created_at("2012-03-27 14:54:12 UTC").to_s
  end

  def test_it_can_find_a_customer_by_updated_at
    Customer.parse
    assert_includes "2 Cecelia", Customer.find_by_updated_at("2012-03-27 14:54:10 UTC").to_s
  end

  def test_it_can_find_all_customers_by_id
    Customer.parse
    customers = Customer.find_all_by_id("3")
    assert_equal 1, customers.count
      assert_equal "Mariah", customers.first.first_name
  end

  def test_it_can_find_all_customers_by_first_name
    Customer.parse
    customers = Customer.find_all_by_first_name("Mariah")
    assert_equal 1, customers.count
    customers.each do |customer|
      assert_includes "3 Mariah", customer.to_s
    end
  end

  def test_it_can_find_all_customers_by_created_at
    Customer.parse
    customers = Customer.find_all_by_created_at("2012-03-27 14:54:10 UTC")
    assert_equal 6, customers.count
    customers.each do |customer|
      assert_includes "2 Cecelia, 3 Mariah, 4 Leanne, 5 Sylvester, 6 Heber, 7 Parker", customer.to_s
    end
  end

  def test_it_can_find_all_customers_by_updated_at
    Customer.parse
    customers = Customer.find_all_by_updated_at("2012-03-27 14:54:10 UTC")
    assert_equal 6, customers.count
    customers.each do |customer|
      assert_includes "2 Cecelia, 3 Mariah, 4 Leanne, 5 Sylvester, 6 Heber, 7 Parker", customer.to_s
    end
  end
end
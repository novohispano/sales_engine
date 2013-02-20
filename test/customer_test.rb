require './test/test_helper'

class CustomerTest < MiniTest::Unit::TestCase
  def setup
    Parser.new
  end

  def test_it_is_initialized_from_an_array_of_data
    assert_equal "11", Customer.customers[10].id
    assert_equal "Logan", Customer.customers[10].first_name
    assert_equal "Kris", Customer.customers[10].last_name
    assert_equal "2012-03-27 14:54:12 UTC", Customer.customers[10].created_at
    assert_equal "2012-03-27 14:54:12 UTC", Customer.customers[10].updated_at
  end

  def test_it_can_return_a_random_value
    refute_equal Customer.random.to_s, Customer.random.to_s
  end

  def test_it_can_find_a_customer_by_id
    assert_equal "3 Mariah", Customer.find_by_id("3").to_s
  end

  def test_it_can_find_a_customer_by_name
    assert_equal "3 Mariah", Customer.find_by_first_name("Mariah").to_s
  end

  def test_it_can_find_a_customer_by_last_name
    assert_equal "3 Mariah", Customer.find_by_last_name("Toy").to_s
  end

  def test_it_can_find_a_customer_by_created_at
    assert_equal "11 Logan", Customer.find_by_created_at("2012-03-27 14:54:12 UTC").to_s
  end

  def test_it_can_find_a_customer_by_updated_at
    assert_includes "2 Cecelia", Customer.find_by_updated_at("2012-03-27 14:54:10 UTC").to_s
  end

  def test_it_can_find_all_customers_by_id
    customers = Customer.find_all_by_id("3")
    assert_equal 1, customers.count
    customers.each do |customer|
      assert_includes "3 Mariah", customer.to_s
    end
  end

  def test_it_can_find_all_customers_by_first_name
    customers = Customer.find_all_by_first_name("Mariah")
    assert_equal 1, customers.count
    customers.each do |customer|
      assert_includes "3 Mariah", customer.to_s
    end
  end

  def test_it_can_find_all_customers_by_last_name
    customers = Customer.find_all_by_last_name("Toy")
    assert_equal 2, customers.count
    customers.each do |customer|
      assert_includes "3 Mariah, 720 Luigi", customer.to_s
    end
  end

  def test_it_can_find_all_customers_by_created_at
    customers = Customer.find_all_by_created_at("2012-03-27 14:54:10 UTC")
    assert_equal 6, customers.count
    customers.each do |customer|
      assert_includes "2 Cecelia, 3 Mariah, 4 Leanne, 5 Sylvester, 6 Heber, 7 Parker", customer.to_s
    end
  end

  def test_it_can_find_all_customers_by_updated_at
    customers = Customer.find_all_by_updated_at("2012-03-27 14:54:10 UTC")
    assert_equal 6, customers.count
    customers.each do |customer|
      assert_includes "2 Cecelia, 3 Mariah, 4 Leanne, 5 Sylvester, 6 Heber, 7 Parker", customer.to_s
    end
  end

  def test_it_can_find_all_invoices_associated_with_a_customer
    customer = Customer.find_by_id("3")
    assert_equal 4, customer.invoices.count
    customer.invoices.each do |invoice|
      assert_includes "10 3 86 shipped, 11 3 62 shipped, 12 3 8 shipped, 13 3 34 shipped", invoice.to_s
    end
  end

  def test_it_can_find_all_successful_invoices_for_customer
    customer = Customer.find_by_id("3")
    assert_equal 3, customer.successful_invoices.count
    customer.successful_invoices.each do |invoice|
      assert_includes "10 3 86 shipped, 11 3 62 shipped, 12 3 8 shipped", invoice.to_s
    end
  end

  def test_it_can_find_all_the_transactions_per_customer
    customer = Customer.find_by_id("25")
    assert_equal 6, customer.transactions.count
    customer.transactions.each do |transaction|
      assert_includes "[[146: 132: success], [147: 133: success], [148: 134: success], [149: 135: success], [150: 136: success], [151: 137: success]]", transaction.to_s
    end
  end
end
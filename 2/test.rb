require_relative '2'
require 'test/unit'

class TestCalculator < Test::Unit::TestCase

  def test_add1
    assert_equal(4, Calculator.new.add(2, 2))
  end

  def test_add2
    assert_equal(-4, Calculator.new.add(-2, -2))
  end

  def test_add3
    assert_equal(0, Calculator.new.add(2, -2))
  end

  def test_add4
    assert_equal(-2, Calculator.new.add(0, -2))
  end

  def test_add5
    assert_equal(4.0, Calculator.new.add(2.0, 2.0))
  end

  # test_substraction
  def test_substr1
    assert_equal(3, Calculator.new.substraction(5, 2))
  end

  def test_substr2
    assert_equal(-3, Calculator.new.substraction(-5, -2))
  end

  def test_substr3
    assert_equal(-7, Calculator.new.substraction(-5, 2))
  end

  def test_substr4
    assert_equal(-5, Calculator.new.substraction(-5, 0))
  end

  def test_substr5
    assert_equal(3.0, Calculator.new.substraction(5.0, 2.0))
  end

  # test_multiply
  def test_multiply1
    assert_equal(10, Calculator.new.multiply(5,2))
  end

  def test_multiply2
    assert_equal(10, Calculator.new.multiply(-5,-2))
  end

  def test_multiply3
    assert_equal(-10, Calculator.new.multiply(-5,2))
  end


  def test_multiply4
    assert_equal(0, Calculator.new.multiply(5.0,0))
  end

  def test_multiply5
    assert_equal(10.0, Calculator.new.multiply(5.0,2.0))
  end

  # test_division
  def test_division1
    assert_equal(25, Calculator.new.division(50,2))
  end

  def test_division2
    assert_equal(25, Calculator.new.division(-50,-2))
  end

  def test_division3
    assert_equal(-25, Calculator.new.division(-50,2))
  end

  def test_division4
    assert_equal(0, Calculator.new.division(0,2))
  end

  def test_division5
    assert_equal(25.0, Calculator.new.division(50,2))
  end
end

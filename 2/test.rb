require_relative '2'
require 'test/unit'

class TestCalculator < Test::Unit::TestCase

def test_add
	assert_equal(4, Calculator.new.add(2,2))
	assert_equal(-4, Calculator.new.add(-2,-2))
	assert_equal(0, Calculator.new.add(2,-2))
	assert_equal(4, Calculator.new.add(2.0,2.0))
end

def test_substr
	assert_equal(3, Calculator.new.substraction(5,2))
	assert_equal(-3, Calculator.new.substraction(-5,-2))
	assert_equal(-7, Calculator.new.substraction(-5,2))
	assert_equal(3.0, Calculator.new.substraction(5.0,2.0))
end

def test_multiply
	assert_equal(10, Calculator.new.multiply(5,2))
	assert_equal(10, Calculator.new.multiply(-5,-2))
	assert_equal(-10, Calculator.new.multiply(-5,2))
	assert_equal(10.0, Calculator.new.multiply(5.0,2.0))
end

def test_division
	assert_equal(25, Calculator.new.division(50,2))
	assert_equal(25, Calculator.new.division(-50,-2))
	assert_equal(-25, Calculator.new.division(-50,2))
	assert_equal(25.0, Calculator.new.division(50,2))
end
end
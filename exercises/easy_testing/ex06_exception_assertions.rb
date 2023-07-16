=begin

Exception Assertions
Write a minitest assertion that will fail unless employee.hire raises a
NoExperienceError exception.
=end

require 'minitest/autorun'
require 'minitest/reporters'
# MiniTest::Reporters.use!

class NoExperienceError < StandardError; end

class Employees
  attr_accessor :experience
  def initialize
    @experience = false
  end

  def hire
    raise NoExperienceError, 'Individual Not Qualified' unless experience
  end
end

class NoExperienceErrorTest < MiniTest::Test
  # Expecting pass. Employee is not experienced, would raise NoExperienceError.
  def test_not_raising_no_experience_error
    employee = Employees.new

    assert_raises NoExperienceError do
      employee.hire
    end
  end

  # Expecting fail. Employee is experienced, NoExperienceError not raised
  def test_raise_no_experience_error
    employee = Employees.new
    employee.experience = true

    assert_raises NoExperienceError do
      employee.hire
    end
  end
end
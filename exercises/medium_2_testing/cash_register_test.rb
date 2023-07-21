require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test
  # def test_accept_money
  #   cash_register = CashRegister.new(100)
  #   transaction = Transaction.new(10)

  #   initial_amount = cash_register.total_money
  #   transaction.prompt_for_payment
  #   cash_register.accept_money(transaction)

  #   assert_equal initial_amount + 10, cash_register.total_money
  # end

  # # OR
  
  # def test_accept_money_alt
  #   cash_register = CashRegister.new(100)
  #   transaction = Transaction.new(10)

  #   initial_amount = cash_register.total_money
  #   transaction.amount_paid = 10
  #   cash_register.accept_money(transaction)
  #   new_amount = cash_register.total_money

  #   assert_equal initial_amount + 10, new_amount
  # end

  # -----------------------------------------------------------------

  # def test_cash_register_change
  #   cash_register = CashRegister.new(100)
  #   transaction = Transaction.new(10)
  #   transaction.amount_paid = 20

  #   assert_equal 10, cash_register.change(transaction)

  # end

  # -----------------------------------------------------------------

  # def test_give_receipt
  #   cash_register = CashRegister.new(100)
  #   transaction = Transaction.new(10)
  #   transaction.amount_paid = 10

  #   assert_output(puts "You've paid $10.") do
  #     cash_register.give_receipt(transaction)
  #   end
  #   # or
  #   assert_output("You've paid $#{transaction.item_cost}.\n") do
  #     cash_register.give_receipt(transaction)
  #   end
  # end

  # -----------------------------------------------------------------

  def test_prompt_for_payment
    cash_register = CashRegister.new(100)
    transaction = Transaction.new(10)

    payment = StringIO.new("10\n")
    output = StringIO.new
    transaction.prompt_for_payment(input: payment, output: output)
    assert_equal 10, transaction.amount_paid
  end
  
end
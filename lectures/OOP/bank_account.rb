# frozen_string_literal: true

# This is the Bank Account class
class BankAccount
  attr_reader :money

  def initialize(money, account_number, owner, bank_name)
    @money = money
    @account_number = account_number
    @owner = owner
    @bank_name = bank_name
  end

  def deposit(money)
    change_balance(money)
  end

  def withdraw(money)
    change_balance(- money)
  end

  private

  def change_balance(value)
    @money += value
  end
end

matts_bank_account = BankAccount.new(0, "666", "Matheus", "Bradesco")
matts_bank_account.money # => 0
matts_bank_account.deposit(50)
matts_bank_account.money # => 50
matts_bank_account.withdraw(100)
puts matts_bank_account.money

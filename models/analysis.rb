require 'pry-byebug'
class Analysis

  attr_accessor :merchants, :tags, :transactions

  def initialize(merchants, tags, transactions)
    @merchants = merchants
    @tags = tags
    @transactions = transactions
  end

  def total_expenditure
    total = 0
    @transactions.each {|transaction| total += transaction.amount}
    return total
  end

end
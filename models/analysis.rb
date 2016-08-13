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

  def total_expenditure_by_tag
    #want to calculate total expenditure by a passed in tag. 
    #extract from transactions, by tag, add together.
    total = 0
    @transactions.each {|transaction| total += transaction.amount if transaction.tag_id == 5 }
    return total
  end

end
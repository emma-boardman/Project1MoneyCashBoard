require 'pry-byebug'
class Analysis

  attr_accessor :merchants, :tags, :transactions

  def initialize(merchants, tags, transactions)
    @merchants = merchants
    @tags = tags
    @transactions = transactions
  end

end
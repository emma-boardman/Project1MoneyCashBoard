require 'pry-byebug'
class Analysis

  attr_accessor :merchants, :tags, :transactions

  def initialize()
    @merchants = Merchant.all
    @transactions = Transaction.all
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



  # def transactions_by_merchant()
  #   #purpose of this function is to show all transactions by one certain merchant.
  #   #need to select all transaction info from transaction table where the merchant id matches the id passed in
  #   #want to be able to show the name of the merchant as well as the ID, so need an inner join
  #   sql = "SELECT t.* FROM transactions t INNER JOIN merchants m ON t.merchant_id = m.id WHERE m.id = 2"
  #   return Transaction.map_items( sql )
  #   #how do I show the name of the merchant?
  # end

  # def transactions_by_tag()
  #   #purpose of this function is to show all transactions by one certain merchant.
  #   #need to select all transaction info from transaction table where the merchant id matches the id passed in
  #   #want to be able to show the name of the merchant as well as the ID, so need an inner join
  #   sql = "SELECT t.* FROM transactions t INNER JOIN tags ON t.tag_id = tag.id WHERE tag.id = 1"
  #   return Transaction.map_items( sql )
  #   #how do I show the name of the merchant?
  # end


end
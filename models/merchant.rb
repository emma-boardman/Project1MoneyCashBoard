require('pg')
require_relative('../db/sql_runner')

class Merchant

attr_reader :id, :name

def initialize( options )
  @id = options['id'].to_i
  @name = options['name']
end

def save()
  sql = "INSERT INTO merchants (name) VALUES ('#{@name}') RETURNING *"
  merchant = SqlRunner.run( sql ).first
  @id = merchant['id']
end 

def self.delete_all()
  sql = "DELETE FROM merchants"
  SqlRunner.run( sql )
end

def self.all()
  sql = "SELECT * FROM merchants"
  merchants = SqlRunner.run( sql )
  result = merchants.map { |m| Merchant.new( m ) }
  return result
end

# def transactions_by_merchant()
#   #purpose of this function is to show all transactions by one certain merchant.
#   #need to select all transaction info from transaction table where the merchant id matches the id passed in
#   #want to be able to show the name of the merchant as well as the ID, so need an inner join
#   sql = "SELECT t.* FROM transactions t INNER JOIN merchants m ON t.merchant_id = m.id WHERE m.id = 1"
#   return Transaction.map_items( sql )
#   #how do I show the name of the merchant?
# end


def self.map_item(sql)
  result = Merchant.map_items(sql)
  return result.first
end


  def self.map_items(sql)
    merchant = SqlRunner.run(sql)
    result = merchant.map { |product| Merchant.new( product ) }
    return result
  end

end
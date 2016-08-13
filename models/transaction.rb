require('pg')
require_relative('../db/sql_runner')

class Transaction

attr_reader :id, :amount, :merchant_id, :tag_id

  def initialize( options )
    @id = options['id'].to_i
    @amount = options['amount'].to_i
    @merchant_id = options['merchant_id'].to_i
    @tag_id = options['tag_id'].to_i
  end

def save()
  sql = "INSERT INTO transactions (amount, merchant_id, tag_id) VALUES (#{@amount}, #{@merchant_id}, #{@tag_id}) RETURNING *"
  transaction = SqlRunner.run( sql ).first
  @id = transaction['id']
end

def self.delete_all()
  sql = "DELETE FROM transactions"
  SqlRunner.run( sql )
end

def self.all()
  sql = "SELECT * FROM transactions"
  return Transaction.map_items( sql )
end

def self.map_items( sql )
  transaction = SqlRunner.run(sql)
  result = transaction.map {|product| Transaction.new( product )}
  return result
end


end

require('pg')
require_relative('../db/sql_runner.rb')

class Tag

attr_reader :id, :tag

def initialize( options )
  @id = options['id'].to_i
  @tag = options['tag']
end

def save()
  sql = "INSERT INTO tags (tag) VALUES ('#{@tag}') RETURNING *"
  tag = SqlRunner.run( sql ).first
  @id = tag['id']
end

def self.delete_all()
  sql = "DELETE FROM tags"
  SqlRunner.run( sql )
end

def self.all()
  sql = "SELECT * FROM tags"
  return Tag.map_items( sql )
end

def self.map_items( sql )
  tag = SqlRunner.run( sql )
  result = tag.map {|product| Tag.new( product )}
  return result
end 

def self.map_item(sql)
  result = Tag.map_items(sql)
  return result.first
end

# def merchants()
#   sql = "SELECT m.* FROM merchants m INNER JOIN transactions t ON m.id = t.merchant_id WHERE t.tag_id = 4"
#   return Merchant.map_items( sql )
# end



end
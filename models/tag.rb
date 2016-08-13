require('pg')
require_relative('../db/sql_runner.rb')

class Tag

attr_reader :id, :tag

def initialize( options )
  @id = options['id'].to_i,
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


end
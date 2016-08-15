require 'pry-byebug'
require_relative('../models/merchant.rb')
require_relative('../models/tag.rb')
require_relative('../models/transaction.rb')
require_relative('../models/analysis.rb')

#index
get '/transactions' do
  @transactions = Transaction.all()
  @analysis = Analysis.new()
  erb :'transactions/index'
end

#new
get '/transactions/new' do
  @merchants = Merchant.all
  @tags = Tag.all
  erb (:'transactions/new')
end

#create
post '/transactions' do
  transaction = Transaction.new(params) 
  transaction.save()
  redirect( to('transactions') )
end

#get a form so the user can enter what they want to search for


get '/transactions/tags/new' do
  @transactions = Transaction.all
  @tags = Tag.all
  erb :'transactions/tags/new'
end

#display transactions by tags defined above
post '/transactions/tags' do
  # binding.pry
  @transactions = Transaction.show_tag( params['tag_id'].to_i )
  binding.pry
  @analysis = Analysis.new
  erb(:'transactions/tags/index')
end



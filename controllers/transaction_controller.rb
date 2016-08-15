require 'pry-byebug'
require_relative('../models/merchant.rb')
require_relative('../models/tag.rb')
require_relative('../models/transaction.rb')

#index
get '/transactions' do
  @transactions = Transaction.all()
  erb :'transactions/index'
end

# #new
# get '/rentals/new' do
#   @books = Book.all()
#   @members = Member.all()
#   erb (:'rentals/new')
# end

# #create
# post '/rentals' do
#   rental = Rental.new(params) #just creats a new object in memory 
#   rental.save()
#   redirect( to('rentals') )
# end

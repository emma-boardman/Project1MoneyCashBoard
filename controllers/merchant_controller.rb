require_relative('../models/merchant')

#index
get '/merchants' do
  @merchants = Merchant.all
  erb(:'merchants/index')
end


#new
get '/merchants/new' do
  @merchants = Merchant.all
  erb (:'merchants/new')
end

#create
post '/merchants' do
  merchant = Merchant.new(params) 
  merchant.save()
  redirect( to('merchants') )
end
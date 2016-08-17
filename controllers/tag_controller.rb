require_relative('../models/tag')

#index
get '/tags' do
  @tags = Tag.all
  @analysis = Analysis.new()
  erb(:'tags/index')
end


#new
get '/tags/new' do
  @tags = Tag.all
  erb (:'tags/new')
end

#create
post '/tags' do
  tag = Tag.new(params) 
  tag.save()
  redirect( to('tags') )
end
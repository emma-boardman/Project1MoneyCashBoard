require_relative('../models/tag')

#index
get '/tags' do
  @tags = Tag.all
  erb(:'tags/index')
end

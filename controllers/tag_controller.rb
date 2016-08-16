require_relative('../models/tag')

#index
get '/tags' do
  @tags = Tag.all
  @analysis = Analysis.new()
  erb(:'tags/index')
end

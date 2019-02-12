require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/tag.rb')
also_reload('../models/*')

get '/money-tracker/tags' do
  @tag = Tag.all()
  erb (:"tags/index")
end

get '/money-tracker/tags/new' do
  erb(:"tags/new")
end

post '/money-tracker/tags' do
  Tag.new(params).save
  redirect to '/money-tracker/tags'
end

get '/money-tracker/tags/:id' do
  @tag = Tag.find(params['id'].to_i)
  erb(:"tags/show")
end

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

get '/money-tracker/tags/:id/edit' do
  @tag = Tag.find(params['id'])
  erb(:"tags/edit")
end

post '/money-tracker/tags/:id' do
  tag = Tag.new(params)
  tag.update
  redirect to '/money-tracker/tags'
end

get '/money-tracker/tags/:id' do
  @tag = Tag.find(params['id'].to_i)
  @spending_by_tag = Transaction.spending_by_tag(@tag.id)
  erb(:"tags/show")
end

post '/money-tracker/tags/:id/delete' do
  tag = Tag.find(params['id'])
  tag.delete
  redirect to '/money-tracker/tags'
end

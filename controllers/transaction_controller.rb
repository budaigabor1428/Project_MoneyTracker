require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/merchant.rb')
require_relative('../models/tag.rb')
require_relative('../models/transaction.rb')
also_reload('../models/*')

get '/money-tracker/transactions' do
  @transactions = Transaction.all()
  erb (:"transactions/index")
end

get '/money-tracker/transactions/new' do
    @merchants = Merchant.all
    @tags = Tag.all
  erb(:"transactions/new")
end

post '/money-tracker/transactions' do
    @transactions = Transaction.new(params)
    @transactions.save()
    redirect to '/money-tracker/transactions'
end

get '/money-tracker/transactions/:id/edit' do
  @merchants = Merchant.all
  @tags = Tag.all
  @transactions = Transaction.find(params['id'])
  erb(:"transactions/edit")
end

post '/money-tracker/transactions/:id' do
  transaction = Transaction.new(params)
  transaction.update
  redirect to '/money-tracker/transactions'
end

get '/money-tracker/transactions/:id' do
  @transactions = Transaction.find(params['id'].to_i)
  erb(:"transactions/show")
end

post '/money-tracker/transactions/:id/delete' do
  tag = Transaction.find(params['id'])
  tag.delete
  redirect to '/money-tracker/transactions'
end

# post "/money-tracker/transactions/filter-by-tag" do
#   tag = params["tag"]
#   @transactions = Transaction.filter_by_tag(tag.id)
#   @total_amount_by_tag = Transaction.total_amount_by_tag(tag.id)
#   erb(:"transactions/filter_by_tag")
# end

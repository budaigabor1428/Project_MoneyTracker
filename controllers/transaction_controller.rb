require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/merchant.rb')
require_relative('../models/tag.rb')
require_relative('../models/transaction.rb')
also_reload('../models/*')

get 'money-tracker/transactions' do
  @transactions = Transaction.all()
  erb (:"transactions/index")
end

get 'money-tracker/transactions/:id' do
  @transactions = Transaction.find(params['id'].to_i)
  erb(:"transactions/show")
end

get '/money-tracker/transactions/new' do
  erb(:"transactions/new")
end

post '/money-tracker/transactions' do
  @transactions = Transaction.new(params)
  @transactions.save()
  erb(:"transactions/create")
end

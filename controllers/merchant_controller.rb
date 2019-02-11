require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/merchant.rb')
also_reload('../models/*')

get 'money-tracker/merchants' do
  @merchants = Merchant.all()
  erb (:"merchants/index")
end

get 'money-tracker/merchants/:id' do
  @merchants = Merchant.find(params['id'].to_i)
  erb(:"merchants/show")
end

get '/money-tracker/merchants/new' do
  erb(:"merchants/new")
end

post '/money-tracker/merchants' do
  @merchants = Merchant.new(params)
  @merchants.save()
  erb(:"merchants/create")
end

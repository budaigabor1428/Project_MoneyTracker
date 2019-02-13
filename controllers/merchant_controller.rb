require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/merchant.rb')
also_reload('../models/*')

get '/money-tracker/merchants' do
  @merchants = Merchant.all()
  erb (:"merchants/index")
end

get '/money-tracker/merchants/new' do
  erb(:"merchants/new")
end

post '/money-tracker/merchants' do
  Merchant.new(params).save
  redirect to '/money-tracker/merchants'
end

get '/money-tracker/merchants/:id/edit' do
  @merchant = Merchant.find(params['id'])
  erb(:"merchants/edit")
end

post '/money-tracker/merchants/:id' do
  merchant = Merchant.new(params)
  merchant.update
  redirect to '/money-tracker/merchants'
end

get '/money-tracker/merchants/:id' do
  @merchant = Merchant.find(params['id'].to_i)
  @spending_by_merchant = Transaction.spending_by_merchant(@merchant.id)
  erb(:"merchants/show")
end

post '/money-tracker/merchants/:id/delete' do
  merchant = Merchant.find(params['id'])
  merchant.delete
  redirect to '/money-tracker/merchants'
end

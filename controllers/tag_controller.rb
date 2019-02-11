require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/tag.rb')
also_reload('../models/*')

get 'money-tracker/tags' do
  @merchants = Merchant.all()
  erb (:"merchants/index")
end

get 'money-tracker/tags/:id' do
  @merchants = Merchant.find(params['id'].to_i)
  erb(:"merchants/show")
end

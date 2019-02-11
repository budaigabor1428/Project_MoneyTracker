require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/merchant_controller')
require_relative('controllers/tag_controller')
require_relative('controllers/transaction_controller')

get '/money-tracker' do
  erb(:index)
end

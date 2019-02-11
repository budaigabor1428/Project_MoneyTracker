# require('sinatra')
# require('sinatra/contrib/all')
# require('pry-byebug')
# require_relative('../models/merchant.rb')
# require_relative('../models/tag.rb')
# require_relative('../models/transaction.rb')
# also_reload('../models/*')
#
# get 'money-tracker/transactions' do
#   @bitings = Biting.all
#   @actions = Action.all
#   erb ( :"transaxtions/index" )
# end
#
# get '/bitings/new' do
#   @victims = Victim.all
#   @zombies = Zombie.all
#   erb(:"bitings/new")
# end
#
# post '/bitings' do
#   biting = Biting.new(params)
#   biting.save
#   redirect to("/bitings")
# end
#
# post '/bitings/:id/delete' do
#   Biting.destroy(params[:id])
#   redirect to("/bitings")
# end

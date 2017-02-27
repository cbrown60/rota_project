require ('sinatra')
require ('sinatra/contrib/all')
require_relative ('../models/shift.rb')
require ('pry')

get '/shifts' do
  @shifts = Shift.all()
  erb(:"shift/index")
  end 


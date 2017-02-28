require ('sinatra')
require ('sinatra/contrib/all')
require_relative ('../models/shift.rb')
require ('pry')

get '/shifts' do
  @shifts = Shift.all()
  erb(:"shift/index")
  end 

get '/shifts/new' do 
  erb(:"shift/new")
end 

post '/shifts' do 
  @shift = Shift.new(params)
  @shift.save
  erb(:home)
end 

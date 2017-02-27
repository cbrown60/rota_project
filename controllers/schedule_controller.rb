require ('sinatra')
require ('sinatra/contrib/all')
require_relative ('../models/schedule.rb')
require ('pry')

get '/schedules' do 
  @schedules = Schedule.all
  erb(:"schedule/index")
end

require ('sinatra')
require ('sinatra/contrib/all')
require_relative ('../models/schedule.rb')
require ('pry')

get '/schedules' do 
  @schedules = Schedule.all
  erb(:"schedule/index")
end

get '/schedules/new' do
  @employees =Employee.all
  @shifts = Shift.all 
  erb(:"schedule/new")
end

post "/schedules" do
  schedule = Schedule.new(params)
  schedule.save
  erb(:"schedule/create")
end



get "/schedules/:id/edit" do 
@schedules = Schedule.find(params[:id])
@employees = Employee.all
@shifts = Shift.all
erb(:"schedule/edit")
end 

# get "/schedules/:id/edit" do 
#   @schedules = Schedule.find(params{[:id]})
#   erb (:"schedules/show")
#   end




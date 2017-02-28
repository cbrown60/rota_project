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

get "/schedules/:id/employee/:employee_id/edit" do 
@schedules = Schedule.find(params[:id])
@employees = Employee.all
@shifts = Shift.all
@employee_id = params[:employee_id].to_i
erb(:"schedule/edit")
end 

#/schedules/:id/employee/:employee_id/shift/:shift_id/edit

#@shift_id = [params]

get "/schedules/:id" do
  schedule = Schedule.new(params)
  schedule.update
  erb(:"schedule/index")
end




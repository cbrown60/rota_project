require ('sinatra')
require ('sinatra/contrib/all')
require_relative ('../models/schedule.rb')
require ('pry')

get '/schedules' do 
  @schedules = Schedule.all
  puts @schedules
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

get "/schedules/:id/employee/:employee_id/shift/:shift_id/edit" do 
@schedules = Schedule.find(params[:id])
@employees = Employee.all
@shifts = Shift.all
@shift_id = params[:shift_id].to_i
@employee_id = params[:employee_id].to_i
erb(:"schedule/edit")
end 

#/schedules/:id/employee/:employee_id/shift/:shift_id/edit

#@shift_id = [params]

post "/schedules/:id" do
  schedule = Schedule.find(params[:id])
  schedule.employee_id = params[:employee_id]
  schedule.shift_id = params[:shift_id]
  schedule.update
  redirect to("/schedules")
end

post '/schedules/:id/delete' do 
  Schedule.delete(params[:id])
    redirect to ("/schedules")
  end 




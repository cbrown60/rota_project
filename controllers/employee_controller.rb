require ('sinatra')
require ('sinatra/contrib/all')
require_relative ('../models/employee.rb')
require ('pry')

  get '/employees' do 
    @employees = Employee.all()
    erb(:"employee/index")
  end 

  get '/employees/new' do 
    erb(:"employee/new")
  end

  post "/employees" do
    @employee = Employee.new(params)
    @employee.save
    erb(:"employee/create")
  end

 



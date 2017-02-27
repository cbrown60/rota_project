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
  

  get "/employees/:id" do
   @employee = Employee.find(params[:id])
   erb(:"employee/show")
   end

  get "/employees/:id/edit" do 
    @employees = Employee.find(params[:id])
    erb(:"employee/edit")
  end 

  post "/employees/:id"do
    employee = Employee.new(params)
    employee.update
    redirect to ("employees/#{employee.id}")
  end
 





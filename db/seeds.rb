require ('pry')
require_relative('../models/employee.rb')
require_relative('../models/shift.rb')
require_relative('../models/schedule.rb')

employee1 = Employee.new({'name'=>'Chris','hours_wanted'=> 25, 'hourly_rate'=>7.50})

employee2 = Employee.new({'name'=>'Caroline','hours_wanted'=> 20, 'hourly_rate'=>7.50})

employee3 = Employee.new({'name'=>'Belle','hours_wanted'=> 20, 'hourly_rate'=>7.50})

shift1 =Shift.new({'start_time'=>'08:00:00','end_time'=>'17:30:00'})

shift2 =Shift.new({'start_time'=>'08:00:00','end_time'=>'17:30:00'})

shift3 =Shift.new({'start_time'=>'11:00:00','end_time'=>'15:00:00'})

schedule1 = Schedule.new({'employee_id'=>employee1.id,'shift_id'=>shift1.id,'date'=>'2017/03/01'})

schedule2 = Schedule.new({'employee_id'=>employee2.id,'shift_id'=>shift2.id,'date'=>'2017/03/02'})

schedule3 = Schedule.new({'employee_id'=>employee3.id,'shift_id'=>shift3.id,'date'=>'2017/03/02'})

binding.pry
nil
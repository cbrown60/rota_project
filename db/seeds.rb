require ('pry')
require_relative('../models/employee.rb')
require_relative('../models/shift.rb')
require_relative('../models/schedule.rb')

Employee.delete_all
Shift.delete_all
Schedule.delete_all





employee1 = Employee.new({'name'=>'Chris','hours_wanted'=> 25, 'hourly_rate'=>7.50})
employee1.save
employee2 = Employee.new({'name'=>'Caroline','hours_wanted'=> 20, 'hourly_rate'=>7.50})
employee2.save
employee3 = Employee.new({'name'=>'Belle','hours_wanted'=> 20, 'hourly_rate'=>7.50})
employee3.save
shift1 =Shift.new({'start_time'=>'08:00:00','end_time'=>'17:30:00'})
shift1.save
shift2 =Shift.new({'start_time'=>'08:00:00','end_time'=>'17:30:00'})
shift2.save
shift3 =Shift.new({'start_time'=>'11:00:00','end_time'=>'15:00:00'})
shift3.save
schedule1 = Schedule.new({'employee_id'=>employee1.id,'shift_id'=>shift1.id,'shift_date'=>'2017/03/01'})
schedule1.save

schedule2 = Schedule.new({'employee_id'=>employee2.id,'shift_id'=>shift2.id,'shift_date'=>'2017/03/02'})
schedule2.save

schedule3 = Schedule.new({'employee_id'=>employee3.id,'shift_id'=>shift3.id,'shift_date'=>'2017/03/02'})
schedule3.save
binding.pry
nil


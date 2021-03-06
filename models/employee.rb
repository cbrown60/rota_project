require_relative ('../db/sql_runner')
class Employee

  attr_accessor :name, :hourly_rate, :hours_wanted
  attr_reader :id

  def initialize (options)
    @id = options['id'].to_i
    @name = options['name']
    @hours_wanted = options['hours_wanted']
    @hourly_rate = options['hourly_rate'].to_f
    # @schedules
    # @total_pay = options['total_pay']
  end

  def save
    sql = "INSERT INTO employees(name, hourly_rate, hours_wanted) VALUES ('#{@name}', #{@hourly_rate}, #{hours_wanted}) RETURNING * "
    result = SqlRunner.run(sql).first 
    @id = result['id'].to_i
   
  end  

  def self.delete(id)
    sql = "DELETE FROM employees WHERE id = #{id};"

   SqlRunner.run(sql)
  end

  def self.delete_all
    sql = "DELETE FROM employees;"
    SqlRunner.run(sql)  
  end

  def self.all()
   sql ="SELECT * FROM employees"
    results = SqlRunner.run(sql)
    return results.map {|employee| Employee.new(employee)}
    end

    def self.find(id)
      sql ="SELECT * FROM employees WHERE id=#{id};"
      employee = SqlRunner.run(sql)
      result = Employee.new(employee.first)
      return result       
    end

    def update
      sql ="UPDATE employees 
            SET name = '#{name}',
            hours_wanted = #{hours_wanted},
            hourly_rate = #{hourly_rate}
            WHERE id = '#{id}'"
            SqlRunner.run(sql)
    end

    def current_shifts
      sql = "SELECT schedule from schedules
              WHERE employees.id = #{@employee_id}"

    end

    # def my_schedule
    #   sql="SELECT * FROM schedules
    #   INNER JOIN employees ON employees.schedule_id = schedules.id
    #   WHERE schedules.id = #{@id};"

    #   schedules = SqlRunner.run(sql)
    #  return Schedule.new(schedules.first)
    # end


  # def my_shift
  # sql = "SELECT shifts.* 
  #         FROM shifts
  #         INNER JOIN schedules
  #         on shifts.id = schedules.shift_id
  #         INNER JOIN employees
  #         on schedules.employee_id = employees.id
  #         WHERE employees.id = #{@id};"
  #  shifts = SqlRunner.run(sql)
  # return shifts.map {|shift|Shift.new(shift)}
  # end
 


 def my_schedule
  sql ="SELECT schedules.* FROM schedules
        INNER JOIN employees
        ON schedules.employee_id = employees.id
        WHERE employees.id = #{@id};"
         schedules = SqlRunner.run(sql)
        return schedules.map {|schedule|Schedule.new(schedule)}
   
 end



 def hours_worked 
   # sql = "SELECT EXTRACT(EPOCH FROM(@end_time - @start_time)) FROM shifts WHERE id = #{@id}"
   # result = SqlRunner.run(sql) 
   # seconds = result.first["date_part"]
   # return seconds.to_f / 60 / 60

   all_employee_schedule = my_schedule()
   
   total_hours = 0
   for schedule in all_employee_schedule
      total_hours += schedule.shift().hours_worked
   end

   return total_hours
 end

    
end
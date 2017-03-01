require_relative ('../db/sql_runner')

class Schedule

  attr_accessor :shift_date, :employee_id, :shift_id
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i
    @employee_id = options['employee_id']
    @shift_id = options['shift_id']
    @shift_date = options['shift_date']
    
  end

  def save
    sql = "INSERT INTO schedules (employee_id, shift_id, shift_date) VALUES (#{@employee_id}, #{@shift_id}, '#{@shift_date}') RETURNING *"
    result = SqlRunner.run(sql).first 
    @id = result['id'].to_i 
  end

  def self.delete(id)
    sql = "DELETE FROM schedules WHERE id = #{id}"  
    SqlRunner.run(sql)
  end 

  def self.delete_all
    sql = "DELETE FROM schedules"
    SqlRunner.run(sql)
  end


  def shift 
   sql ="SELECT shifts.id, shifts.start_time, shifts.end_time FROM shifts
            INNER JOIN schedules ON schedules.shift_id = shifts.id 
            WHERE shifts.id = #{@shift_id};"
      shifts = SqlRunner.run(sql)
     return Shift.new(shifts.first) 
   end
  
  def employee
   sql ="SELECT * FROM employees
            INNER JOIN schedules ON schedules.employee_id = employees.id 
            WHERE employees.id = #{@employee_id};"
      employees = SqlRunner.run(sql)
     return Employee.new(employees.first) 

  end

  # def date

  #   sql = "SELECT date FROM schedules
  #        "
  #     dates =SqlRunner.run(sql)
  #     return Schedule.new(dates.first)

  # end

  def self.all()

    sql = "SELECT * FROM schedules"
    results = SqlRunner.run(sql)
    return results.map {|result|Schedule.new(result) }
  end

  def self.find(id)
    sql="SELECT * FROM schedules WHERE id =#{id};"
    schedule = SqlRunner.run(sql)
    result = Schedule.new(schedule.first)
    return result 
  end

  def update
    sql ="UPDATE schedules 
          SET employee_id = #{@employee_id},
          shift_id = #{@shift_id}
          WHERE id = #{@id}"
          SqlRunner.run(sql)
  end
  
  def sort
    psql = "SELECT * FROM schedules
            ORDER BY shift_date DESC"
            SqlRunner.run(psql)
      
  end


end 

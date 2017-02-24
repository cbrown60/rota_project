require_relative ('../db/sql_runner')

class Schedule

  attr_accessor :date
  attr_reader :id, :employee_id, :shift_id

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

  def delete 
    sql = "DELETE FROM shedules WHERE id = #{@id}"  
    SqlRunner.sql(sql)
  end 

  def self.delete_all
    sql = "DELETE FROM schedules"
    SqlRunner.run(sql)
  end

  
end 

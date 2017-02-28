require_relative ('../db/sql_runner')

class Employee

  attr_accessor :name, :hourly_rate, :hours_wanted
  attr_reader :id

  def initialize (options)
    @id = options['id'].to_i
    @name = options['name']
    @hours_wanted = options['hours_wanted']
    @hourly_rate = options['hourly_rate'].to_f
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
  
  
end 
require_relative('../db/sql_runner')

class Shift

  attr_accessor :start_time, :end_time
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i
    @start_time = options['start_time']
    @end_time = options['end_time']

  end

  def save
    sql = "INSERT INTO shifts (start_time, end_time) VALUES ('#{start_time}', '#{end_time}') RETURNING * "
    result = SqlRunner.run(sql).first 
    @id = result['id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM shifts"
    SqlRunner.run(sql)
  end

  def delete
    sql = "DELETE FROM shifts WHERE id = #{@id}"
    SqlRunner.run(sql)
  end
 
end
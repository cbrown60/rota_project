require_relative ('../db/sql_runner')

class Schedule

  attr_accessor :date
  attr_reader :id, :employee_id, :shift_id

  def initialize(options)
    @id = options['id'].to_i
    @employee_id = options['employee_id']
    @shift_id = options['shift_id']
    @date = options['date']
    
  end

end 
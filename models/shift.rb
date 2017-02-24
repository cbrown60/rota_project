require_relative('../db/sql_runner')

class Shift

  attr_accessor :start_time, :end_time
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i
    @start_time = options['start_time'].to_i
    @end_time = options['end_time'].to_i

  end

end
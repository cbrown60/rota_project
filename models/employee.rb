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
       
  end  

end 
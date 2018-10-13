class UserInput

  attr_reader :input_params, :valid_simulation_type, :valid_active_cashiers, :valid_simulation_time, :valid_time_delay

  def initialize
    @input_params = Array.new 4
    @valid_simulation_type = true
    @valid_active_cashiers = true
    @valid_simulation_time = true
    @valid_time_delay = true
  end

  def read_simulation_type
    input = gets.chomp
    validate_simulation_type input:input
    @input_params[0] = input if @valid_simulation_type
  end

  def validate_simulation_type input:
    @valid_simulation_type = true
    @valid_simulation_type = false if input.size != 1
    @valid_simulation_type = false if input != 'v' && input != 'u'
  end

  def read_active_cashiers
    input = gets.chomp
    validate_active_cashiers input:input
    @input_params[1] = input if @valid_active_cashiers
  end

  def validate_active_cashiers input:
    @valid_active_cashiers = true
    @valid_active_cashiers = false if !/\A\d+\z/.match(input) || input.to_i == 0
  end

  def read_simulation_time
    input = gets.chomp
    validate_simulation_time input:input
    @input_params[2] = input if @valid_simulation_time
  end

  def validate_simulation_time input:
    @valid_simulation_time = true
    @valid_simulation_time = false if !/\A\d+\z/.match(input) || input.to_i == 0
  end

  def read_time_delay
    input = gets.chomp
    validate_time_delay input:input
    @input_params[3] = input if @valid_time_delay
  end

  def validate_time_delay input:
    @valid_time_delay = true
    @valid_time_delay = false if !/\A\d+\z/.match(input)
  end
end

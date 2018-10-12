class SimulationParams

  attr_reader :simulation_type:, :number_of_cashiers, :simulation_time, :simulation_time_delay

  def initialize input_params:

    @simulation_type: = input_params[0]
    @number_of_cashiers = input_params[1].to_i
    @simulation_time = input_params[2].to_i
    @simulation_time_delay = input_params[3].to_f

  end
end

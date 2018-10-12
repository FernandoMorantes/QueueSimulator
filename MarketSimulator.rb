load 'UserInput.rb'
load 'GraphicRepresentation.rb'
load 'SimulatorCalculations.rb'
load 'SimulationParams.rb'

class MarketSimulator

  def start_simulation

    puts "Simulador de filas\n"

    puts "- Simulacion para varias filas (v)\n"
    puts "- Simulacion para unica fila (u)\n"
    puts "----------------------------------------------------------------------\n"

    @simulation_params = get_simulation_params

    if @simulation_params.simulation_type == 'v'
      @market = MarketMultipleQueue.new number_of_cashiers:@simulation_params.number_of_cashiers
    else
      @market = MarketUniqueQueue.new number_of_cashiers:@simulation_params.number_of_cashiers
    end

    simulation_iteration = 1
    @simulation_calculator = SimulatorCalculations.new
    @graphic_representator = GraphicRepresentation.new(market:@market, simulation_type:@simulation_params.simulation_type)

    until @simulation_params.simulation_time < simulation_iteration

      puts "Iteracion: #{simulation_iteration}"

      if simulation_iteration % 3 == 0
        @market.put_new_clients_in_queue
      end

      @market.work

      @graphic_representator.draw_market

      sleep @simulation_params.simulation_time_delay
      simulation_iteration += 1
    end

    (@market.cashiers).each do |cashier|
      @simulation_calculator.add_attended_clients attended_clients:cashier.clients_attended
    end

    average_waiting_time = @simulation_calculator.get_average_waiting_time

    puts "Tiempo promedio de espera por cliente: #{average_waiting_time}"

  end

  def get_simulation_params

    user_input = UserInput.new

    puts "Ingrese el tipo de simulacion (v o u)\n"
    begin
      user_input.read_simulation_type
      puts "Parametro ingresado no valido\n" if !user_input.valid_simulation_time
    end while !user_input.valid_simulation_type

    puts "----------------------------------------------------------------------\n"
    puts "Ingrese el numero de cajas activas\n"
    begin
      user_input.read_active_cashiers
      puts "Parametro ingresado no valido\n" if !user_input.valid_active_cashiers
    end while !user_input.valid_active_cashiers

    puts "----------------------------------------------------------------------\n"
    puts "Ingrese la cantidad de tiempo a simular (en minutos)\n"
    begin
      user_input.read_simulation_time
      puts "Parametro ingresado no valido\n" if !user_input.valid_simulation_time
    end while !user_input.valid_simulation_time

    puts "----------------------------------------------------------------------\n"
    puts "Ingrese el tiempo entre iteraciones de la simulacion (en segundos)\n"
    begin
      user_input.read_time_delay
      puts "Parametro ingresado no valido\n" if !user_input.valid_time_delay
    end while !user_input.valid_time_delay

    SimulationParams.new input_params:user_input.input_params
  end

end

market_simulator =  MarketSimulator.new
market_simulator.start_simulation

load 'UserInput.rb'
load 'GraphicRepresentation.rb'
load 'SimulatorCalculations.rb'
load 'SimulationParams.rb'

class MarketSimulator

  def startSimulation

    puts "Simulador de filas\n"

    puts "- Simulacion para varias filas (v)\n"
    puts "- Simulacion para unica fila (u)\n"
    puts "----------------------------------------------------------------------\n"

    @simulationParams = getSimulationParams

    if @simulationParams.simulationType == 'v'
      @market = MarketMultipleQueue.new @simulationParams.numberOfCashiers
    else
      @market = MarketUniqueQueue.new @simulationParams.numberOfCashiers
    end

    simulationIteration = 1
    @simulationCalculator = SimulatorCalculations.new
    @graphicRepresentator = GraphicRepresentation.new(market:@market, simulationType:@simulationParams.simulationType)

    until @simulationParams.simulationTime < simulationIteration

      puts "Iteracion: #{simulationIteration}"

      if simulationIteration % 3 == 0
        @market.clientsArrive numberOfClients:Random.rand(0...6)
        @market.assignClientsInQueue
      end

      (@market.cashiers).each do |cashier|
        cashier.work
        #me parece que el metodo que aumenta el riempo de espera de los clientes en la fila debe ir aca
      end

      @graphicRepresentator.drawMarket

      sleep @simulationParams.simulationTimeDelay
      simulationIteration += 1
    end

    (@market.cashiers).each do |cashier|
      @simulationCalculator.addAttendedClients attendedClients:cashier.clients_attended
    end

    averageWaitingTime = @simulationCalculator.getAverageWaitingTime

    puts "Tiempo promedio de espera por cliente: #{averageWaitingTime}"

  end

  def getSimulationParams

    userInput = UserInput.new

    puts "Ingrese el tipo de simulacion (v o u)\n"
    begin
      userInput.readSimulationType
      puts "Parametro ingresado no valido\n" if !userInput.validSimulationType
    end while !userInput.validSimulationType

    puts "----------------------------------------------------------------------\n"
    puts "Ingrese el numero de cajas activas\n"
    begin
      userInput.readActiveCashiers
      puts "Parametro ingresado no valido\n" if !userInput.validActiveCashiers
    end while !userInput.validActiveCashiers

    puts "----------------------------------------------------------------------\n"
    puts "Ingrese la cantidad de tiempo a simular (en minutos)\n"
    begin
      userInput.readSimulationTime
      puts "Parametro ingresado no valido\n" if !userInput.validSimulationTime
    end while !userInput.validSimulationTime

    puts "----------------------------------------------------------------------\n"
    puts "Ingrese el tiempo entre iteraciones de la simulacion (en segundos)\n"
    begin
      userInput.readTimeDelay
      puts "Parametro ingresado no valido\n" if !userInput.validTimeDelay
    end while !userInput.validTimeDelay

    SimulationParams.new inputParams:userInput.inputParams
  end

end

marketSimulator =  MarketSimulator.new
marketSimulator.startSimulation

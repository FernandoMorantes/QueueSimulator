class SimulationParams

  attr_reader :simulationType, :numberOfCashiers, :simulationTime, :simulationTimeDelay

  def initialize inputParams:

    @simulationType = inputParams[0]
    @numberOfCashiers = inputParams[1].to_i
    @simulationTime = inputParams[2].to_i
    @simulationTimeDelay = inputParams[3].to_f

  end
end

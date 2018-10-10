class UserInput

  attr_reader :inputParams, :validSimulationType, :validActiveCashiers, :validSimulationTime, :validTimeDelay

  def initialize
    @inputParams = Array.new 4
    @validSimulationType = true
    @validActiveCashiers = true
    @validSimulationTime = true
    @validTimeDelay = true
  end

  def readSimulationType
    input = gets.chomp
    validateSimulationType input:input
    @inputParams[0] = input if @validSimulationType
  end

  def validateSimulationType input:
    @validSimulationType = true
    @validSimulationType = false if input.size != 1
    @validSimulationType = false if input != 'v' && input != 'u'
  end

  def readActiveCashiers
    input = gets.chomp
    validateActiveCashier input:input
    @inputParams[1] = input if @validActiveCashiers
  end

  def validateActiveCashier input:
    @validActiveCashiers = true
    @validActiveCashiers = false if !/\A\d+\z/.match(input) || input.to_i == 0
  end

  def readSimulationTime
    input = gets.chomp
    validateSimulationTime input:input
    @inputParams[2] = input if @validSimulationTime
  end

  def validateSimulationTime input:
    @validSimulationTime = true
    @validSimulationTime = false if !/\A\d+\z/.match(input) || input.to_i == 0
  end

  def readTimeDelay
    input = gets.chomp
    validateTimeDelay input:input
    @inputParams[3] = input if @validTimeDelay
  end

  def validateTimeDelay input:
    @validTimeDelay = true
    @validTimeDelay = false if !/\A\d+\z/.match(input)
  end
end

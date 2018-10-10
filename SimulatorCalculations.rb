class SimulatorCalculations

  def initialize
    @attendedClients = []
  end

  def addAttendedClients attendedClients:
    @attendedClients << attendedClients
    @attendedClients.flatten!
  end

  def getAverageWaitingTime
    totalWaitingTime = 0

    @attendedClients.each do |client|
      totalWaitingTime += client.time_on_line
    end

    (totalWaitingTime)/(@attendedClients.size)
  end

end

class SimulatorCalculations

  def initialize
    @attended_clients = []
  end

  def add_attended_clients attended_clients:
    @attended_clients << attended_clients
    @attended_clients.flatten!
  end

  def get_average_waiting_time
    total_waiting_time = 0

    @attended_clients.each do |client|
      total_waiting_time += client.time_on_line
    end

    (total_waiting_time)/(@attended_clients.size)
  end

end

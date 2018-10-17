class SimulatorCalculations

  attr_reader :attended_clients, :clients_list

  def initialize
    @attended_clients = []
    @clients_in_market = []
    @clients_list = []
  end

  def add_attended_clients attended_clients:
    @attended_clients << attended_clients
    @attended_clients.flatten!
  end

  def add_clients_in_market clients_in_market:
    @clients_in_market << clients_in_market
    @clients_in_market.flatten!
  end

  def get_clients_list
    @clients_list << @attended_clients
    @clients_list << @clients_in_market
    @clients_list.flatten!
  end

  def get_average_waiting_time
    total_waiting_time = 0
    average_waiting_time = 0

    get_clients_list

    @clients_list.each do |client|
      total_waiting_time += client.time_on_line
    end

    average_waiting_time = (total_waiting_time)/(@clients_list.size) if !@clients_list.empty?

    average_waiting_time
  end

end

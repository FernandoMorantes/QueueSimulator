class Cashier
  attr_reader :clients_attended, :actual_client, :time_to_be_available, :line

  def initialize(line_for_cashier)
    @clients_attended = []
    @line = line_for_cashier
    @time_to_be_available = 0
  end

  def receive_client_from_line
    @actual_client = @line.remove_first_client
    @time_to_be_available = @actual_client.shopping_time
  end

  def available?
    @time_to_be_available.zero?
  end

  def work
    if available?
      finish_client unless @actual_client.nil?
      receive_client_from_line unless @line.number_of_clients.zero?
    else
      process_client
    end
  end

  def process_client
    @time_to_be_available -= 1
  end

  def finish_client
    @clients_attended << @actual_client
    @actual_client = nil
  end
end

load 'supermarket.rb'

class MarketUniqueQueue < Market
  attr_reader :cashiers, :queue

  def create_cashiers(number_of_cashiers)
    @queue = Queue.new
    @cashiers = Array.new(number_of_cashiers) { Cashier.new(@queue) }
  end

  def put_new_clients_in_queue
    i = 0
    new_clients = receive_new_clients
    @queue.receive_client new_clients.shift while i < new_clients.size
  end

  def work
    @cashiers.each(&:work)
    @queue.count_wait_time_for_clients
  end
end

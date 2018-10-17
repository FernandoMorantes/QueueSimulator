load 'cashier.rb'
load 'client.rb'
load 'queue.rb'

class Market
  attr_reader :cashiers

  def initialize(number_of_cashiers:)
    create_cashiers number_of_cashiers
  end

  def receive_new_clients
    Array.new(rand 5) { Client.new }
  end
end

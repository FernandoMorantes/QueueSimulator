class GraphicRepresentation

  def initialize market:, simulation_type:
    @market = market
    @simulation_type = simulation_type
  end

  def draw_market
    (@simulation_type == 'u')? draw_unique_queue_market : draw_multiple_queues_market
  end

  def draw_unique_queue_market

    (@market.cashiers.size).times do
      print "|C|   "
    end

    print "\n"

    (@market.cashiers).each do |cashier|
      print " #{cashier.actual_client.name}   "
    end

    print "\n\n"

    queue_ident_to_center = ((@market.cashiers.size)/2)*6

    (@market.queue.clients).each do |client|
      queue_ident_to_center.times {print ' '}
      print "|#{client.name}|  \n"
    end

  end

  def draw_multiple_queues_market

    (@market.cashiers.size).times do
      print "|C|   "
    end

    print "\n"

    (@market.cashiers).each do |cashier|
      print " #{cashier.actual_client.name}   "
    end

    print "\n\n"

    longest_queue = get_longest_queue queues:@market.queues

    longest_queue.times do |i|
      (@market.queues).each do |queue|
        (!queue.clients[i].nil?) ? print("|#{queue.clients[i].name}|  ") : print('      ')
      end
      print "\n"
    end

  end

  def get_longest_queue queues:
    queues_size = []

    queues.each do |queue|
      queues_size << queue.size
    end

    queues_size.max
  end
end

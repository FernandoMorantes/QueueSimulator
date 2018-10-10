class GraphicRepresentation

  def initialize market:, simulationType:
    @market = market
    @simulationType = simulationType
  end

  def drawMarket
    (simulationType == 'u')? drawUniqueQueueMarket : drawMultipleQueueMarket
  end

  def drawUniqueQueueMarket

    (@market.cashiers.size).times do
      print "|C|   "
    end

    print "\n"

    (@market.cashiers).each do |cashier|
      print " #{cashier.actual_client.name}   "
    end

    print "\n\n"

    queueIdentToCenter = ((@market.cashiers.size)/2)*6

    (@market.queue.clients).each do |client|
      queueIdentToCenter.times {print ' '}
      print "|#{client.name}|  \n"
    end

  end

  def drawMultipleQueueMarket

    (@market.cashiers.size).times do
      print "|C|   "
    end

    print "\n"

    (@market.cashiers).each do |cashier|
      print " #{cashier.actual_client.name}   "
    end

    print "\n\n"

    longestQueue = getLongestQueue queues:@market.queues

    longestQueue.times do |i|
      (@market.queues).each do |queue|
        print "|#{queue.clients[i].name}|  "
      end
      print "\n"
    end

  end

  def getLongestQueue queues:
    queuesSize = []

    queues.each do |queue|
      queuesSize << queue.size
    end

    queuesSize.max
  end
end

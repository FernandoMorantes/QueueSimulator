class Queue
    attr_reader :clients

    def initialize
        @clients = Array.new 
    end
    
    def receive_client new_client
        @clients << new_client
    end

    def number_of_clients
        @clients.size
    end

    def remove_first_client 
        @clients.shift
    end

    def count_wait_time_for_clients
        @clients.each { |c| c.wait_on_line }
    end
end

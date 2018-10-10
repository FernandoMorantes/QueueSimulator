class Cashier
    attr_reader :clients_attended, :actual_client, :time_to_be_available

    def initialize line_for_cashier 
        @clients_attended = Array.new
        @line = line_for_cashier
        @time_to_be_available = 0
    end

    def receive_client_from_line
        @actual_client = @line.remove_first_client
        @time_to_be_available = @actual_client.shopping_time
    end

    def is_available?
        if @time_to_be_available == 0
            return true
        else
            return false
        end
    end

    def work
        if is_available? 
            if @actual_client != nil
                finish_client
            end
            if @line.number_of_clients != 0
                receive_client_from_line
            end
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

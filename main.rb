class Client
   attr_reader :name, :shopping_time, :time_on_line 
   
   def initialize
        @name = [*('a'..'z')].sample(2).join       
        @shopping_time = Random.rand(4...25)
        @time_on_line = 0
   end

   def wait_on_line
        @time_on_line += 1
   end
end

class Line
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

class Cashier
    attr_reader :clients_attend, :line, :client

    def initialize line_for_cash 
        @clients_attend = Array.new
        @line = line_for_cash
        @time_to_get_available = 0
    end

    def receive_client_from_line
        @client = @line.remove_first_client
        @time_to_get_available = @client.shopping_time
    end

    def is_available?
        if @time_to_get_available == 0
            return true
        else
            return false
        end
    end

    def work
        if is_available?
            finish_client
            receive_client_from_line
            process_client
        else
            process_client
        end
    end

    def process_client
        @time_to_get_available -= 1 
    end

    def finish_client
        @clients_attend << @client
        @client = nil
    end
end




#single line
queaue = Line.new

c1 = Cashier.new(queaue)
c2 = Cashier.new(queaue)
c3 = Cashier.new(queaue)
c4 = Cashier.new(queaue)

$i = 0
$num = 180
while $i < $num  do
    if i % 3 = 0
        queaue.receive_client Client.new    
    end
    
    $i +=1
 end


queaue = Line.new

cliente = Client.new
queaue.receive_client cliente

cliente = Client.new
queaue.receive_client cliente

#queaue.count_wait_time_for_clients

cliente = Client.new
queaue.receive_client cliente

#queaue.count_wait_time_for_clients

cliente = Client.new
queaue.receive_client cliente

queaue.clients.each { |a| puts "Nombre Cliente:#{a.name} Tiempo en caja:#{a.shopping_time} Tiempo espera:#{a.time_on_line}" }



#caja =  Cashier.new(queaue)
#puts "Nombre Cliente:#{cliente.name} Tiempo en caja:#{cliente.shopping_time}"

gets.chomp


load "client.rb"
load "queue.rb"
load "cashier.rb"

#Test
queaue = Queue.new

c1 = Cashier.new(queaue)

queue.receive_client Client.new

$i = 0
$num = 3
while $i < $num  do
    c1.work
    a = c1.actual_client
    puts "Nombre Cliente:#{a.name} Tiempo en caja:#{a.shopping_time} Tiempo espera:#{a.time_on_line}"
    puts "Tiempo para disponible:#{c1.time_to_be_available}"
    $i +=1
 end
 queue.receive_client Client.new #recibe cliente luego de tres iteraciones

 $i = 0
 $num = 300
 while $i < $num  do
     c1.work
     a = c1.actual_client
     puts "Nombre Cliente:#{a.name} Tiempo en caja:#{a.shopping_time} Tiempo espera:#{a.time_on_line}"
     puts "Tiempo para disponible:#{c1.time_to_be_available}"
     $i +=1
  end

gets.chomp


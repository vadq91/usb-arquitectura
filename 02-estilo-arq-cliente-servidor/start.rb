require_relative 'server/server'
require_relative 'client/client'

@server = nil
@client = nil

def show_menu
  puts ""
  puts "Seleccione una opción:"
  puts "1. Iniciar servidor"
  puts "2. Detener servidor"
  puts "3. Iniciar cliente"
  puts "4. Enviar mensaje"
  puts "5. Terminar conexión"
  puts "6. Salir"
end

def init_server
  puts "Ingrese el puerto de escucha: (3000)"
  port = gets.chomp
  port = 3000 if port.empty?

  @server = Server.new port
  @server.start
end

def stop_server
  @server.stop
end

def init_client
  puts "Ingrese el servidor: (localhost)"
  server = gets.chomp
  server = 'localhost' if server.empty?

  puts "Ingrese el puerto: (3000)"
  port = gets.chomp
  port = 3000 if port.empty?

  Client.start_connection server, port
end

def send_message
  puts "Ingrese el mensaje: "
  msg = gets.chomp

  Client.send_message msg
end

def stop_connection
  Client.stop_connection
end

loop do
  show_menu
  opcion = gets.chomp.to_i

  case opcion
  when 1
    init_server
  when 2
    stop_server
  when 3
    init_client
  when 4
    send_message
  when 5
    stop_connection
  when 6
    puts "Saliendo..."
    break
  else
    puts "Opción no válida, por favor intente de nuevo."
  end
end

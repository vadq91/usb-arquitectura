require 'socket'
require 'thread'

require_relative 'network/peer'

if __FILE__ == $0
  port = ARGV.shift.to_i
  peers = ARGV.map(&:to_i)

  peer = Peer.new(port, peers)
  puts "Nodo corriendo en el puerto #{port}"
  peer.list_peers

  def show_menu
    puts ""
    puts "Seleccione una opción:"
    puts "1. Enviar mensaje"
    puts "2. Conectar con un nodo"
    puts "3. Listar nodos"
    puts "4. Salir"
  end

  loop do
    show_menu
    opcion = STDIN.gets.chomp.to_i

    case opcion
    when 1
      puts "Ingrese el mensaje a enviar"
      message = STDIN.gets.chomp
      peer.send_message(message)
    when 2
      puts "Ingrese el puerto del nodo"
      nodo = STDIN.gets.chomp.to_i
      peer.add_peer(nodo)
    when 3
      peer.list_peers
    when 4
      exit
    else
      puts "Opción no válida, por favor intente de nuevo."
    end
  end
end

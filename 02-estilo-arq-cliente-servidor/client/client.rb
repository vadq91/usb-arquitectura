require 'socket'

class Client
  attr_reader :conn

  def self.start_connection(server, port)
    @conn = TCPSocket.new(server, port)
  end

  def self.send_message(message)
    return puts "No hay conexiones activas" if @conn.nil?

    @conn.puts message

    puts @conn.gets
  end

  def self.stop_connection
    return puts "No hay conexiones activas" if @conn.nil?

    @conn.close
    @conn = nil

    puts "Conexión terminada"
  end
end

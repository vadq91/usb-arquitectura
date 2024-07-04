require 'socket'
require_relative 'client_handler'

class Server
  attr_accessor :port, :socket, :thread

  def initialize(port)
    @port = port
  end

  def start
    @thread = Thread.new(@socket) do
      @socket = Socket.new Socket::AF_INET, Socket::SOCK_STREAM, 0

      addr = Socket.sockaddr_in @port, 'localhost'
      @socket.bind(addr)

      @socket.listen(5)

      puts "Server is listening on port #{@port}"

      ClientHandler.handle_events @socket
    end
  end

  def stop
    @socket.close
    @thread.exit
  end
end

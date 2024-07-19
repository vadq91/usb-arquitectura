class Peer
  def initialize(port, peers = [])
    @port = port
    @peers = peers
    @server = TCPServer.new('localhost', port)
    @mutex = Mutex.new
    start_server
  end

  def start_server
    Thread.new do
      loop do
        client = @server.accept
        handle_client(client)
      end
    end
  end

  def handle_client(client)
    Thread.new do
      message = client.gets.chomp
      puts "Mensaje recibido: #{message}"
      client.close
    end
  end

  def send_message(message)
    @mutex.synchronize do
      @peers.each do |peer|
        begin
          socket = TCPSocket.new('localhost', peer)
          socket.puts(message)
          socket.close
        rescue
          puts "Fallo la conexion con el nodo en el puerto #{peer}"
        end
      end
    end
  end

  def add_peer(peer_port)
    @mutex.synchronize do
      @peers << peer_port unless @peers.include?(peer_port)
    end
  end

  def list_peers
    @peers.each do |peer|
      puts "Conectado con el nodo en el puerto #{peer}"
    end
  end
end

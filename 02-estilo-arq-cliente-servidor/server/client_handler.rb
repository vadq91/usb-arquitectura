class ClientHandler
  attr_reader :buffer_thread
  def self.handle_events(socket)
    loop {                           # Servers run forever
      Thread.start(socket.accept) do |client|
        client.puts "#{Time.now.ctime}: Hola!"   # Send the time to the client
        client.puts "Envia :x para terminar la conexion"
        data = client.recv(1024)

        if data == ':x'
          client.puts "Adiós!"
          client.close
        end

        client.write "#{Time.now.ctime}: Recibi tu información."
      end
    }
  end
end

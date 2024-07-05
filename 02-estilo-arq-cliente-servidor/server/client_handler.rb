class ClientHandler
  attr_reader :buffer_thread
  def self.handle_events(socket)
    loop {
    Thread.current.report_on_exception = false

      Thread.start(socket.accept) do |client, _client_addr|
        puts "#{Time.now.ctime} -> Hola desde el server!"

        data = client.recv(1024)

        client.write "#{Time.now.ctime} -> Recibí tu información: #{data}"  unless data.nil?

        client.close
      end
    }
  end
end

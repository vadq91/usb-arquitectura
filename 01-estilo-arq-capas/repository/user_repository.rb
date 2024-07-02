class UserRepository
  @@database = nil

  def self.init_database
    @@database = []

    puts 'Base de datos inicializada'
  end

  def self.database
    @@database
  end

  def self.insert(data)
    @@database << data
    @@database.length - 1    
  end

  def self.select(idx)
    @@database[idx]
  end

  def self.delete(idx)
    @@database.delete_at(idx)
  end

  def self.update(idx, data)
    @@database[idx] = data
  end
end

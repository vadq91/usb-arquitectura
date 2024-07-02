require_relative '../model/user_model'
require_relative '../repository/user_repository'

class UserService
  @user = nil

  def initialize
    UserRepository.init_database
  end

  def list_all
    if UserRepository.database.length.zero?
      puts "No existen registros"
      return false
    end

    UserRepository.database.each_with_index do |user, idx|
      puts "[Indice #{idx}] ID #{user.id}: - #{user.full_name}"
    end

    true
  end

  def create(id, full_name)
    @user = UserModel.new

    @user.id = id
    @user.full_name = full_name

    idx = UserRepository.insert(@user)

    puts "Usuario registrado, indice: #{ idx }"
  end

  def update(idx, user)
    UserRepository.update(idx, @user)
  end

  def delete (idx)
    UserRepository.delete idx

    puts "Registro eliminado"
  end

  def load_by_id(id)
    @user = nil
    idx = nil

    UserRepository.database.each_with_index do |user, d_idx|
      if id == user.id
        puts "Registro encontrado, indice: #{d_idx} - #{user.full_name}"
        idx = d_idx
        @user = user
        break
      end
    end

    puts "Registro no encontrado" if idx.nil?

    { idx: idx, user: @user }
  end
end

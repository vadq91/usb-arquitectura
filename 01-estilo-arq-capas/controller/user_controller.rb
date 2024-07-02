require_relative '../service/user_service'

class UserController
  @user_service = nil

  def initialize
    @user_service = UserService.new
  end

  def create(id, full_name)
    @user_service.create(id, full_name)
  end

  def find(id)
    @user_service.load_by_id id
  end

  def delete
    loop do
      puts ""

      break unless @user_service.list_all

      puts "Ingrese el ID del usuario a eliminar (-1 para salir)."

      id = gets.chomp.to_i

      break if id == -1

      found = @user_service.load_by_id id

      next if found[:idx].nil?
      
      @user_service.delete found[:idx]
    end
  end

  def update
    loop do
      puts ""

      break unless @user_service.list_all

      puts "Ingrese el ID del usuario a editar (-1 para salir)."

      id = gets.chomp.to_i

      break if id == -1

      found = @user_service.load_by_id id

      next if found[:idx].nil?
      
      puts "Ingrese el ID del usuario"
      found[:user].id = gets.chomp.to_i

      puts "Ingrese el nombre completo del usuario"
      found[:user].full_name = gets.chomp

      @user_service.update(found[:idx], found[:user])
    end
  end
end

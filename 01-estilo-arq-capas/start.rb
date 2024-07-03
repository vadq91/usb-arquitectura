require_relative 'controller/user_controller'

puts 'Administracion de usuarios'
@user_controller = UserController.new

def show_menu
  puts ""
  puts "Seleccione una opción:"
  puts "1. Registrar usuario"
  puts "2. Buscar usuario"
  puts "3. Editar usuario"
  puts "4. Eliminar usuario"
  puts "5. Salir"
end

def create_user
  puts "Ingrese el ID del usuario"
  id = gets.chomp.to_i
  puts "Ingrese el nombre completo del usuario"
  name = gets.chomp

  @user_controller.create(id, name)
end

def search_user
  puts "Ingrese el ID del usuario"
  id = gets.chomp.to_i

  @user_controller.find(id)
end

def update_user
  @user_controller.update
end

def delete_user
  @user_controller.delete
end

loop do
  show_menu
  opcion = gets.chomp.to_i

  case opcion
  when 1
    create_user
  when 2
    search_user
  when 3
    update_user
  when 4
    delete_user
  when 5
    puts "Saliendo..."
    break
  else
    puts "Opción no válida, por favor intente de nuevo."
  end
end

puts "Programa terminado."

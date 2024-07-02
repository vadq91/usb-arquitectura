require_relative 'controller/user_controller'

puts 'Administracion de usuarios'
@user_controller = UserController.new

def mostrar_menu
  puts ""
  puts "Seleccione una opción:"
  puts "1. Registrar usuario"
  puts "2. Buscar usuario"
  puts "3. Editar usuario"
  puts "4. Eliminar usuario"
  puts "5. Salir"
end

def registrar_usuario
  puts "Ingrese el ID del usuario"
  id = gets.chomp.to_i
  puts "Ingrese el nombre completo del usuario"
  name = gets.chomp

  @user_controller.create(id, name)
end

def buscar_usuario
  puts "Ingrese el ID del usuario"
  id = gets.chomp.to_i

  @user_controller.find(id)
end

def editar_usuario
  @user_controller.update
end

def eliminar_usuario
  @user_controller.delete
end

loop do
  mostrar_menu
  opcion = gets.chomp.to_i
  
  case opcion
  when 1
    registrar_usuario
  when 2
    buscar_usuario
  when 3
    editar_usuario
  when 4
    eliminar_usuario
  when 5
    puts "Saliendo..."
    break
  else
    puts "Opción no válida, por favor intente de nuevo."
  end
end

puts "Programa terminado."

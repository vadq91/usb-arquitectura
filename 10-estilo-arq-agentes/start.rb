require_relative 'agents/task_agent'
require_relative 'agents/user_agent'

def show_menu
  puts ""
  puts "Seleccione una opción:"
  puts "1. Inicilizar agente de tareas"
  puts "2. Registrar una tarea"
  puts "3. Listar tareas"
  puts "4. Inicializar agente de usuarios"
  puts "5. Crear usuario"
  puts "6. Listar usuarios"
  puts "7. Asignar tarea"
  puts "8. Salir"
end

@task_agent = nil
@user_agent = nil

def init_task_agent
  unless @task_agent.nil?
    puts "El agente ya se encuentra inicializado"
  end

  @task_agent = TaskManagement::TaskAgent.new
end

def init_user_agent
  unless @user_agent.nil?
    puts "El agente ya se encuentra inicializado"
  end

  @user_agent = UserManagement::UserAgent.new
end

def create_task
  return unless raise_unless_initialized(@task_agent)

  puts "Ingrese el titulo de la tarea"
  title = gets.chomp

  puts "Ingrese la descripcion de la tarea"
  description = gets.chomp

  task = @task_agent.create_task(title, description)

  puts "Tarea registrada con el id #{ task[:id] }"
end

def list_task
  return unless raise_unless_initialized(@task_agent)

  @task_agent.tasks.each do |task|
    puts "ID: #{task[:id]}"
    puts "Titulo: #{task[:title]}"
    puts "Descripcion: #{task[:description]}"
    puts "Usuario asignado: #{task[:assigned_to]}"
    puts "-----------------------------------------"
  end
end

def create_user
  return unless raise_unless_initialized(@user_agent)

  puts "Ingrese el nombre del usuario"
  name = gets.chomp

  user = @user_agent.create_user(name)

  puts "Usuario registrado con el id #{ user[:id] }"
end

def list_user
  return unless raise_unless_initialized(@user_agent)

  @user_agent.users.each do |user|
    puts "ID: #{user[:id]}"
    puts "Titulo: #{user[:name]}"
    puts "-----------------------------------------"
  end

end

def asign_task
  return unless raise_unless_initialized(@user_agent)

  return unless raise_unless_initialized(@task_agent)

  puts "Ingrese el ID del usuario"
  user_id = gets.chomp.to_i

  user = @user_agent.find_user(user_id)

  if user.nil?
    puts "Usuario no encontrado"
    return
  end

  puts "Ingrese el ID de la tarea"
  task_id = gets.chomp.to_i

  puts @task_agent.assign_task(task_id, user[:name])
end

def raise_unless_initialized(agent)
  return true unless agent.nil?

  puts "***ERROR*** El agente no se encuentra inicializado"

  false
end

loop do
  show_menu
  opcion = gets.chomp.to_i

  case opcion
  when 1
    init_task_agent
  when 2
    create_task
  when 3
    list_task
  when 4
    init_user_agent
  when 5
    create_user
  when 6
    list_user
  when 7
    asign_task
  when 8
    puts "Saliendo..."
    break
  else
    puts "Opción no válida, por favor intente de nuevo."
  end
end

puts "Programa terminado."

module TaskManagement
  class TaskAgent
    attr_reader :tasks

    def initialize
      puts "Agente de tareas inicializado"
      @tasks = []
    end

    def create_task(title, description)
      task = { id: @tasks.size + 1, title: title, description: description, completed: false, assigned_to: nil }
      @tasks << task
      task
    end

    def assign_task(task_id, user)
      task = find_task(task_id)
      if task
        task[:assigned_to] = user
        "Tarea #{task_id} asignada al usuario #{user}"
      else
        "Tarea #{task_id} no encontrada"
      end
    end

    private

    def find_task(task_id)
      @tasks.find { |task| task[:id] == task_id }
    end
  end
end

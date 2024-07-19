module UserManagement
  class UserAgent
    attr_reader :users

    def initialize
      puts "Agente de usuarios inicializado"
      @users = []
    end

    def create_user(name)
      user = { id: @users.size + 1, name: name }
      @users << user
      user
    end

    def find_user(user_id)
      @users.find { |user| user[:id] == user_id }
    end
  end
end

require 'sqlite3'

class Robot
  def initialize(robot_params)
    @name = robot_params["name"]
    @city = robot_params["city"]
    @state = robot_params["state"]
    @department = robot_params["department"]
    @database = SQLite3::Database.new('db/robot_world_development.db')
    @database.results_as_hash = true
    @id = task_params["id"] if task_params["id"]
  end

  def save
    @database.execute("INSERT INTO tasks (name, city, state, department) VALUES (?, ?, ?, ?);", @name, @city, @state, @department)
  end
end

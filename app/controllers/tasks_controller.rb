class TasksController

  def self.list
    Task.all
  end

  def self.add(sentence)
    Task.create(name: sentence)
  end

  # Note this is not the id in the database. This id identifies where on the list the task is.
  def self.delete(task_id)
    tasks = Task.all

    if task_id > tasks.count or task_id < 1
      "Error: invalid task ID provided."
    else
      task = Task.all[task_id - 1].destroy
      task.valid? ? "Deleted '#{task.name}' from your TODO list..." : "Error: Something went wrong. Please try again later."
    end
  end
end

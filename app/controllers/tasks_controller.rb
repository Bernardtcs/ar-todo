class TasksController

  def self.display_menu
    TasksView.display_menu
  end

  def self.list
    TasksView.list Task.all
  end

  def self.add(sentence)
    task = Task.create(name: sentence)
    task.valid? ? "Appended #{sentence} to your TODO list..." : "Error: #{task.errors.messages[:name].first}"
  end

  # Note this is not the id in the database. This id identifies where on the list the task is.
  def self.delete(task_id)
    task = find_task task_id

    if task
      task = task.destroy
      task.valid? ? "Deleted '#{task.name}' from your TODO list..." : "Error: Something went wrong. Please try again later."
    else
      "Error: invalid task ID provided."
    end
  end

  def self.complete(task_id)
    task = find_task task_id

    if task
      update_result = task.update_attributes completed: true
      update_result ? "Completed '#{task.name}' from your TODO list..." : "Error: Something went wrong. Please try again later."
    else
      "Error: invalid task ID provided."
    end

  end

  def self.find_task(task_id)
    tasks = Task.all

    (task_id > tasks.count or task_id < 1) ? nil : tasks[task_id - 1]
  end
end

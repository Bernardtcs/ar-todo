class TasksController

  def self.menu
    TasksView.display_menu
  end

  def self.list
    TasksView.display_list Task.all
  end

  def self.add(sentence)
    task = Task.create(name: sentence)
    if task.valid?
      TasksView.display_notice "Appended #{sentence} to your TODO list..."
    else
      TasksView.display_notice "Error: #{task.errors.messages[:name].first}"
    end
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

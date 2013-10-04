require_relative 'config/application'
require_relative 'app/controllers/tasks_controller'

def execute_todo_app
  if ARGV.any?

    case ARGV[0]
      when "list"
        handle_list_command
      when "add"
        handle_add_command ARGV[1..-1].join(' ')
      when "delete"
        handle_delete_command ARGV[1]
      when "complete"
        handle_complete_command ARGV[1]
      when "help"
        display_menu
      else
        puts "invalid command"
        display_menu
    end

  else
    display_menu
  end
end

def display_menu
  puts
  puts "*" * 100
  puts "Usage:"
  puts "ruby todo.rb list \t\t\t\t # List all tasks"
  puts "ruby todo.rb add TASK \t\t\t\t # Add task to do e.g. ruby todo.rb Buy groceries"
  puts "ruby todo.rb delete NUM_OF_TASK_TO_DELETE \t # Delete a task e.g. ruby todo.rb delete 1"
  puts "ruby todo.rb delete NUM_OF_TASK_TO_DELETE \t # Complete a task e.g. ruby todo.rb complete 1"
  puts
end

def handle_list_command
  tasks = TasksController.list

  if tasks.empty?
    puts
    puts "Woohoo no tasks to complete yet!"
    puts
  else
    tasks.each_with_index do |task, i|
      completed = task.completed ? 'x' : ' '
      puts "#{i+1}.".ljust(4) + "[#{completed}] #{task.name}"
    end
  end
end

def handle_add_command(sentence)
  puts TasksController.add sentence
end

def handle_delete_command(task_id)
  puts TasksController.delete task_id.to_i
end

def handle_complete_command(task_id)
  puts TasksController.complete task_id.to_i
end


### Program execution starts here ###

execute_todo_app





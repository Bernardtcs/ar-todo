require_relative 'config/application'
require_relative 'app/controllers/tasks_controller'

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
    tasks.each_with_index { |task, i| puts "#{i+1}.".ljust(4) + task.name }
  end
end

def handle_add_command(sentence)
  task = TasksController.add sentence
  task.valid? ? (puts "Appended #{sentence} to your TODO list...") : (puts "Error: #{task.errors.messages[:name].first}")
end


### Program execution starts here ###

if ARGV.any?

  case ARGV[0]
    when "list"
      handle_list_command
    when "add"
      handle_add_command ARGV[1..-1].join(' ')
    when "delete"
      puts "delete"
    when "complete"
      puts "complete"
    else
      puts "invalid command"
      display_menu
  end

else
  display_menu
end




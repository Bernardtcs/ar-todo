require_relative 'config/application'

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

if ARGV.any?

  case ARGV[0]
    when "list"
      puts "list"
    when "add"
      puts "add"
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




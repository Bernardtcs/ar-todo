require_relative 'config/application'

def execute_todo_app
  if ARGV.any?

    case ARGV[0]
      when "list"
        TasksController.list
      when "add"
        handle_add_command ARGV[1..-1].join(' ')
      when "delete"
        handle_delete_command ARGV[1]
      when "complete"
        handle_complete_command ARGV[1]
      when "help"
        TasksController.display_menu
      else
        puts "invalid command"
        TasksController.display_menu
    end

  else
    TasksController.display_menu
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





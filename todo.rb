require_relative 'config/application'

def execute_todo_app
  if ARGV.any?

    case ARGV[0]
      when "list"
        TasksController.list
      when "add"
        TasksController.add ARGV[1..-1].join(' ')
      when "delete"
        handle_delete_command ARGV[1]
      when "complete"
        handle_complete_command ARGV[1]
      when "help"
        TasksController.menu
      else
        puts "invalid command"
        TasksController.menu
    end

  else
    TasksController.menu
  end
end

def handle_delete_command(task_id)
  puts TasksController.delete task_id.to_i
end

def handle_complete_command(task_id)
  puts TasksController.complete task_id.to_i
end


### Program execution starts here ###

execute_todo_app





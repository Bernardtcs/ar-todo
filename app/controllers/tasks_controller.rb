class TasksController < ActiveRecord::Base

  def self.list
    Task.all
  end
end

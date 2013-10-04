class TasksController < ActiveRecord::Base

  def self.list
    Task.all
  end

  def self.add(sentence)
    Task.create(name: sentence)
  end
end

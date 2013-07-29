class User < ActiveRecord::Base
  has_one :root_task, :class_name => 'Task', :foreign_key => 'author_id'
  has_many :authored_tasks, :class_name => 'Task', :foreign_key => 'author_id'
  has_many :ownerships
  has_many :owned_tasks, :through => :ownerships, :source => :task

  def name
    display_name || "#{first_name} #{last_name}"
  end
end
